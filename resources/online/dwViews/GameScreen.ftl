<html>

	<head>
		<!-- Web page title -->
    	<title>Top Trumps</title>
    	
    	<!-- Import JQuery, as it provides functions you will probably find useful (see https://jquery.com/) -->
    	<script src="https://code.jquery.com/jquery-2.1.1.js"></script>
    	<script src="https://code.jquery.com/ui/1.11.1/jquery-ui.js"></script>
    	<link rel="stylesheet" href="https://code.jquery.com/ui/1.11.1/themes/flick/jquery-ui.css">

		<!-- Optional Styling of the Website, for the demo I used Bootstrap (see https://getbootstrap.com/docs/4.0/getting-started/introduction/) -->
		<link rel="stylesheet" href="http://dcs.gla.ac.uk/~richardm/TREC_IS/bootstrap.min.css">
    	<script src="http://dcs.gla.ac.uk/~richardm/vex.combined.min.js"></script>
    	<script>vex.defaultOptions.className = 'vex-theme-os';</script>
    	<link rel="stylesheet" href="http://dcs.gla.ac.uk/~richardm/assets/stylesheets/vex.css"/>
    	<link rel="stylesheet" href="http://dcs.gla.ac.uk/~richardm/assets/stylesheets/vex-theme-os.css"/>
    	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">

	</head>

    <body onload="initalize()"> <!-- Call the initalize method when the page loads -->
    	  <!--CSS for Game Screen-->
            <style>
                    .footer {
                        position: absolute;
                    right: 0;
                    bottom: 10;
                    left: 0;
                        font: italic;
                        text-align: center;
                    }
                </style>
    	<div class="container">
<br/>
		<div id="playing-cards" class="container">
<div class="card-deck">
        <div class="card border-success" style="width: 18rem;">
            <div class="card-header text-center text-white bg-success mb-3" style="max-width: 18rem;">
                <h5>Player (Number of cards)</h5>
            </div>
            <div class="card-name text-center">
                    <h5>Card Name</h5>
                </div>
                <div class="card-body">
                  
                  <p class="card-attributes">
                      <ul>
                          <li>Speed:</li>
                          <li>Cargo:</li>
                          <li>Size:</li>
                          <li>Range:</li>
                          <li>Firepower:</li>
                      </ul>
                  </p>
                </div>
              </div>

              <div class="card border-danger" style="width: 18rem;">
                    <div class="card-header text-center text-white bg-danger mb-3" style="max-width: 18rem;">
                        <h5>AI Player 1 (Number of cards)</h5>
                    </div>
                    <div class="card-name text-center">
                            <h5>Card Name</h5>
                        </div>
                        <div class="card-body">
                          
                          <p class="card-attributes">
                              <ul>
                                  <li>Speed:</li>
                                  <li>Cargo:</li>
                                  <li>Size:</li>
                                  <li>Range:</li>
                                  <li>Firepower:</li>
                              </ul>
                          </p>
                        </div>
                      </div>

                      <div class="card border-danger" style="width: 18rem;">
                            <div class="card-header text-center text-white bg-danger mb-3" style="max-width: 18rem;">
                                <h5>AI Player 2 (Number of cards)</h5>
                            </div>
                            <div class="card-name text-center">
                                    <h5>Card Name</h5>
                                </div>
                                <div class="card-body">
                                  
                                  <p class="card-attributes">
                                      <ul>
                                          <li>Speed:</li>
                                          <li>Cargo:</li>
                                          <li>Size:</li>
                                          <li>Range:</li>
                                          <li>Firepower:</li>
                                      </ul>
                                  </p>
                                </div>
                              </div>

                              <div class="card border-danger" style="width: 18rem;">
                                    <div class="card-header text-center text-white bg-danger mb-3" style="max-width: 18rem;">
                                        <h5>AI Player 3 (Number of cards)</h5>
                                    </div>
                                    <div class="card-name text-center">
                                            <h5>Card Name</h5>
                                        </div>
                                        <div class="card-body">
                                          
                                          <p class="card-attributes">
                                              <ul>
                                                  <li>Speed:</li>
                                                  <li>Cargo:</li>
                                                  <li>Size:</li>
                                                  <li>Range:</li>
                                                  <li>Firepower:</li>
                                              </ul>
                                          </p>
                                        </div>
                                      </div>

                                      <div class="card border-danger" style="width: 18rem;">
                                            <div class="card-header text-center text-white bg-danger mb-3" style="max-width: 18rem;">
                                                <h5>AI Player 4 (Number of cards)</h5>
                                            </div>
                                            <div class="card-name text-center">
                                                    <h5>Card Name</h5>
                                                </div>
                                                <div class="card-body">
                                                  
                                                  <p class="card-attributes">
                                                      <ul>
                                                          <li>Speed:</li>
                                                          <li>Cargo:</li>
                                                          <li>Size:</li>
                                                          <li>Range:</li>
                                                          <li>Firepower:</li>
                                                      </ul>
                                                  </p>
                                                </div>
                                              </div>
</div>
</div><br/><br/><br/>
<div class="mx-auto" style="width: 200px;">
        <div class="card border-primary mb-3" style="width: 18rem;">
                <div class="card-header text-center text-white bg-primary mb-3" style="max-width: 18rem;">
                    <h5>The active player is </h5>
                </div>
                <div class="card-body text-center">
                        <h5>Game Announcement</h5>
                    </div>
                  </div><br/><br/>
      </div>	
		
		</div>
		
		<div class="footer">Designed and Engineered by The Dabbin' Cavern in Glasgow, Scotland
        </div>
		
		<script type="text/javascript">
		
			// Method that is called on page load
			function initalize() {
				startGame ();
			
				// --------------------------------------------------------------------------
				// You can call other methods you want to run when the page first loads here
				// --------------------------------------------------------------------------
				
				// For example, lets call our sample methods
				helloJSONList();
				helloWord("Student");
				
			}
			
			// -----------------------------------------
			// Add your other Javascript methods Here
			// -----------------------------------------
			
			//----Global Variables----//
			
			
			var roundNum;
			var numOfPlayers;
			var categorySelected;
		
			// This is a reusable method for creating a CORS request. Do not edit this.
			function createCORSRequest(method, url) {
  				var xhr = new XMLHttpRequest();
  				if ("withCredentials" in xhr) {

    				// Check if the XMLHttpRequest object has a "withCredentials" property.
    				// "withCredentials" only exists on XMLHTTPRequest2 objects.
    				xhr.open(method, url, true);

  				} else if (typeof XDomainRequest != "undefined") {

    				// Otherwise, check if XDomainRequest.
    				// XDomainRequest only exists in IE, and is IE's way of making CORS requests.
    				xhr = new XDomainRequest();
    				xhr.open(method, url);

 				 } else {

    				// Otherwise, CORS is not supported by the browser.
    				xhr = null;

  				 }
  				 return xhr;
			}
			
			
			
			
			function startRound () {
				
				var xhr = createCORSRequest('GET', "http://localhost:7777/toptrumps/startRound")
						if(!xhr){
					  		alert("CORS not supported");
						}
						xhr.send();
				
						
						
			function resolveRound () {
							
				var xhr = createCORSRequest('GET', "http://localhost:7777/toptrumps/resolveRound")
						if(!xhr){
							alert("CORS not supported");
									}
					xhr.send();
			
			}
			
			function getRoundNumber(){
				var xhr = createCORSRequest('GET', "http://localhost:7777/toptrumps/getRoundNumber");
				if(!xhr){
			  		alert("CORS not supported");
		  		}
				xhr.send();
				xhr.onload = function(e){
			  		roundNumber =  xhr.response;
			  	} 
				
				
			function getRoundWinner(){
					//  create a CORS request, this is the message we are going to send (a get request in this case)
					var xhr = createCORSRequest('GET', "http://localhost:7777/toptrumps/getRoundWinner"); // Request type and URL+parameters
					// Message is not sent yet, but we can check that the browser supports CORS
					if (!xhr) {
						alert("CORS not supported");
					}
					
					// We have done everything we need to prepare the CORS request, so send it
					xhr.send()
					
					xhr.onload = function(e){
				  		document.getElementById("(insert element you want)").innerHTML = "" + roundNum + ":  " + xhr.response;
				  	} 
				
			function numberOfPlayers() {
		                var xhr = createCORSRequest('GET', "http://localhost:7777/toptrumps/numOfPlayers"); // Request type and URL
		                if (!xhr) {
		                    alert("CORS not supported");
		                }
		                xhr.onload = function(e) {
		                    var responseText = JSON.parse(xhr.response); // the text of the response
		                    numOfPlayers = parseInt(responseText[0]);
		                    
		                    
		                    
		     function namesOfPlayers() {
		              var xhr = createCORSRequest('GET', "http://localhost:7777/toptrumps/namesOfPlayers"); // Request type and URL
		                    if (!xhr) {
		                            alert("CORS not supported");
		                        }
		                    xhr.onload = function() {
		                           var  responseText = JSON.parse(xhr.response); // the text of the response
		                            var n = parseInt(responseText[0]); //number of players
		                            for (var i=1; i<(n+1); i++) {
		                                $(".nameOfPlayer"+i).text(responseText[i]);
		                            }
		                        };
		                        xhr.send();
		                    }
					
		    function activePlayer() {
		                var xhr = createCORSRequest('GET', "http://localhost:7777/toptrumps/activePlayer"); // Request type and URL
		                if (!xhr) {
		                    alert("CORS not supported");
		                }
		                xhr.onload = function(e) {
		                    var responseText = JSON.parse(xhr.response); // the text of the response
		                    $("p").parent().removeClass("active");
		                    console.log("response old active player: " + activePlayerVar);
		                    activePlayerVar = responseText;
		                    $("p:contains('"+ activePlayerVar +"')").parent().toggleClass("active");
		                    console.log("response active player: " + activePlayerVar);
		                    
		                    
		    function cardCatNames() {
		                 var xhr = createCORSRequest('GET', "http://localhost:7777/toptrumps/cardCat"); // Request type and URL
		                 if (!xhr) {
		                 alert("CORS not supported");
		                        }
		                 xhr.onload = function(e) {
		                 var responseText = JSON.parse(xhr.response); // the text of the response
		                 for(var i=0; i<responseText.length; i++) {
		                 $("#nameOfCat"+(i+1)).text(responseText[i]);
		                 $("#nameOfCat"+(i+1)+"Btn").text(responseText[i]);
		                            }
		                        };
		                        xhr.send();
		                    }
		        		   
		      function getCardValues() {
		                       var xhr = createCORSRequest('GET', "http://localhost:7777/toptrumps/getCardValues"); // Request type and URL
		                       if (!xhr) {
		                           alert("CORS not supported");
		                       }
		                       xhr.onload = function(e) {
		                           var responseText = JSON.parse(xhr.response); // the text of the response
		                           for (var i=0; i<responseText.length; i++) {
		                               $("#cat"+(i+1)+"Value").text(parseInt(responseText[i]));
		                           }
		                       };
		                       xhr.send();
		                   }
				
		                
		    function setCategory(clicked_id) {
				      document.getElementById('Btn')
				        categorySelected = clicked_id;
				          console.log("this clicked id is: " + categorySelected);
		
		   
		            	
		    function getchosenCategory() {
		         var xhr = createCORSRequest('PUT', "http://localhost:7777/toptrumps/categorySelection"); // Request type and URL+parameters
		                if (!xhr) {
		                        alert("CORS not supported");
		                    }
		                    xhr.onload = function(e) {
		                        var responseText = xhr.response; // the text of the response
		                        $('#chosenCategory').text(responseText); //change user interface with chosen category
		                    };
		                    xhr.send();
		                }        	
		            	
		    
		    function communityPileSize() {
                var xhr = createCORSRequest('GET', "http://localhost:7777/toptrumps/communityPileSize"); // Request type and URL
                	if (!xhr) {
                		alert("CORS not supported");
                }
                xhr.onload = function(e) {
                    var responseText = JSON.parse(xhr.response); // the text of the response
                    $('#communityPileSize').text(parseInt(responseText[0]));
                };
                xhr.send();
                
                
            function getCardName(){
        		  	var xhr = createCORSRequest('GET', "http://localhost:7777/toptrumps/getCardName	");
        			xhr.send();
        			xhr.onload = function(e){
        		  		var responseText = xhr.response;
        		  		document.getElementById("cardName").innerHTML = responseText;
        		  	} 
        	  	}
                
            }
		    
		   
		    
		            	
		</script>
		
		<!-- Here are examples of how to call REST API Methods -->
		<script type="text/javascript">
		
			// This calls the helloJSONList REST method from TopTrumpsRESTAPI
			function helloJSONList() {
			
				// First create a CORS request, this is the message we are going to send (a get request in this case)
				var xhr = createCORSRequest('GET', "http://localhost:7777/toptrumps/helloJSONList"); // Request type and URL
				
				// Message is not sent yet, but we can check that the browser supports CORS
				if (!xhr) {
  					alert("CORS not supported");
				}

				// CORS requests are Asynchronous, i.e. we do not wait for a response, instead we define an action
				// to do when the response arrives 
				xhr.onload = function(e) {
 					var responseText = xhr.response; // the text of the response
					alert(responseText); // lets produce an alert
				};
				
				// We have done everything we need to prepare the CORS request, so send it
				xhr.send();		
			}
			
			// This calls the helloJSONList REST method from TopTrumpsRESTAPI
			function helloWord(word) {
			
				// First create a CORS request, this is the message we are going to send (a get request in this case)
				var xhr = createCORSRequest('GET', "http://localhost:7777/toptrumps/helloWord?Word="+word); // Request type and URL+parameters
				
				// Message is not sent yet, but we can check that the browser supports CORS
				if (!xhr) {
  					alert("CORS not supported");
				}

				// CORS requests are Asynchronous, i.e. we do not wait for a response, instead we define an action
				// to do when the response arrives 
				xhr.onload = function(e) {
 					var responseText = xhr.response; // the text of the response
					alert(responseText); // lets produce an alert
				};
				
				// We have done everything we need to prepare the CORS request, so send it
				xhr.send();		
			}

		</script>
		
		</body>
</html>