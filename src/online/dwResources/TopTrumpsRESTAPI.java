package online.dwResources;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;

import controler.TopTrumpsContoller;
import model.Database;
import model.DatabaseResponse;
import model.TopTrumpsModel;
import online.configuration.TopTrumpsJSONConfiguration;
import view.OnlineView;
import view.RoundObjectToJson;

@Path("/toptrumps") // Resources specified here should be hosted at http://localhost:7777/toptrumps
@Produces(MediaType.APPLICATION_JSON) // This resource returns JSON content
@Consumes(MediaType.APPLICATION_JSON) // This resource can take JSON content as input
/**
 * This is a Dropwizard Resource that specifies what to provide when a user
 * requests a particular URL. In this case, the URLs are associated to the
 * different REST API methods that you will need to expose the game commands to
 * the Web page.
 * 
 * Below are provided some sample methods that illustrate how to create REST API
 * methods in Dropwizard. You will need to replace these with methods that allow
 * a TopTrumps game to be controled from a Web page.
 */
public class TopTrumpsRESTAPI {

	/**
	 * A Jackson Object writer. It allows us to turn Java objects into JSON strings
	 * easily.
	 */
	ObjectWriter oWriter = new ObjectMapper().writerWithDefaultPrettyPrinter();
	TopTrumpsModel model;
	OnlineView view;

	/**
	 * Contructor method for the REST API. This is called first. It provides a
	 * TopTrumpsJSONConfiguration from which you can get the location of the deck
	 * file and the number of AI players.
	 * 
	 * @param conf
	 */
	public TopTrumpsRESTAPI(TopTrumpsJSONConfiguration conf) {
		// ----------------------------------------------------
		// Add relevant initalization here
		// ----------------------------------------------------

		boolean writeGameLogsToFile = false; // Should always be false
		model = new TopTrumpsModel(writeGameLogsToFile);
		view = new OnlineView(model);
		view.setTopTrumpsRESTAPI(this);
		new TopTrumpsContoller(model, view);

	}

	// ----------------------------------------------------
	// Add relevant API methods here
	// ----------------------------------------------------

	@GET
	@Path("/helloJSONList")
	/**
	 * Here is an example of a simple REST get request that returns a String. We
	 * also illustrate here how we can convert Java objects to JSON strings.
	 * 
	 * @return - List of words as JSON
	 * @throws IOException
	 */
	public String helloJSONList() throws IOException {

		List<String> listOfWords = new ArrayList<String>();
		listOfWords.add("Hello");
		listOfWords.add("World!");

		// We can turn arbatory Java objects directly into JSON strings using
		// Jackson seralization, assuming that the Java objects are not too complex.
		String listAsJSONString = oWriter.writeValueAsString(listOfWords);

		return listAsJSONString;
	}

	@GET
	@Path("/helloWord")
	/**
	 * Here is an example of how to read parameters provided in an HTML Get request.
	 * 
	 * @param Word - A word ?Word=
	 * @return - A String
	 * @throws IOException
	 */
	public String helloWord(@QueryParam("Word") String Word) throws IOException {
		return "Hello " + Word;

	}

//	@GET
//	@Path("/newGame")
//	public void newGame() {
//		view.startGameListner.startNewGame(5);
//	}
//
	RoundObjectToJson response;

	@GET
	@Path("/response")
	public String response(@QueryParam("selection") int selection, @QueryParam("update") boolean update) throws IOException {
		
		
		if(update) {
		do {
			if (response == null || response.gameFinished) {
				view.autoResolve = false;
				view.startGameListner.startNewGame(5);
			} else if (!response.roundHasBeenResolved) {
				if (response.playersTurnIndex == 0) {
					// User's turn so...
					view.userSelectionListner.userSelection(selection);
					

				} else {
					view.nextCatagoryListener.nextCategory();
				}
			} else {
				if (model.nextTurnPossible()) {
					view.nextRoundListener.nextRound();
				} else if (model.resolveComputerTurnPossible()) {
					view.nextCatagoryListener.nextCategory();
				}
			}
		} while (view.autoResolve);
		}
		return oWriter.writeValueAsString(response);

	}

	/// ***** relevant methods ******///

	/// ******** Database API methods ********///
	@GET

	@Path("/totalGames")
	/**
	 * Get total games played from the database
	 * 
	 * @return total games played
	 * @throws IOException
	 */
	public String totalGames() throws IOException {
		Database db = new Database();
		db.connectToDB();
		DatabaseResponse response = db.getDatabaseStats();
		int totalGames = response.getTotalGamesPlayed();
		String stringTotalGames = String.valueOf(totalGames);
		String asJSONString = oWriter.writeValueAsString(stringTotalGames);
		db.disconnectDB();
		return asJSONString;
	}

	@GET
	@Path("/humanWins")
	/**
	 * Get total games played from the database
	 * 
	 * @return total games played
	 * @throws IOException
	 */
	public String humanWins() throws IOException {
		Database db = new Database();
		db.connectToDB();
		DatabaseResponse response = db.getDatabaseStats();
		int humanWins = response.getTotalHumanWins();
		String stringHumanWins = String.valueOf(humanWins);
		String asJSONString = oWriter.writeValueAsString(stringHumanWins);
		db.disconnectDB();
		return asJSONString;
	}

	@GET
	@Path("/AIWins")
	/**
	 * Get total games played from the database
	 * 
	 * @return total games played
	 * @throws IOException
	 */
	public String AIWins() throws IOException {
		Database db = new Database();
		db.connectToDB();
		DatabaseResponse response = db.getDatabaseStats();
		int aiWins = response.getTotalComputerWins();
		String stringAIWins = String.valueOf(aiWins);
		String asJSONString = oWriter.writeValueAsString(stringAIWins);
		db.disconnectDB();
		return asJSONString;
	}

	@GET
	@Path("/averageDraws")
	/**
	 * Get average draws per game played from the database
	 * 
	 * @return total games played
	 * @throws IOException
	 */
	public String averageDraws() throws IOException {
		Database db = new Database();
		db.connectToDB();
		DatabaseResponse response = db.getDatabaseStats();
		int averageDraws = response.getAverageDrawsPerGame();
		String stringAverageDraws = String.valueOf(averageDraws);
		String asJSONString = oWriter.writeValueAsString(stringAverageDraws);
		db.disconnectDB();
		return asJSONString;
	}

	@GET
	@Path("/longestGame")
	/**
	 * Get total games played from the database
	 * 
	 * @return total games played
	 * @throws IOException
	 */
	public String longestGame() throws IOException {
		Database db = new Database();
		db.connectToDB();
		DatabaseResponse response = db.getDatabaseStats();
		int longestGame = response.getLargestNumberOfRounds();
		String stringLongestGame = String.valueOf(longestGame);
		String asJSONString = oWriter.writeValueAsString(stringLongestGame);
		db.disconnectDB();
		return asJSONString;
	}

	public void setRoundResponce(RoundObjectToJson responce) {
		this.response = responce;
	}
}
