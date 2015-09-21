<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>



<portlet:defineObjects />

<portlet:actionURL var="addAnalyticsActionURL" windowState="normal" name="addAnalytic">
</portlet:actionURL>


<%@ page import="java.sql.*" %>

<% Class.forName("com.mysql.jdbc.Driver"); %>




<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	 <!-- script jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

<!-- end script jquery -->
</head>
<body> 

<button id="auth-button" hidden="true">Authorize</button>

<h1>Google Analytics</h1>
    
<script>
	var continuar1=true;
  // Replace with your client ID from the developer console.
  var CLIENT_ID = '755854461794-c95jqb4lqquhggb1sf7o35jqlc6s15h2.apps.googleusercontent.com';

  // Set authorized scope.
  var SCOPES = ['https://www.googleapis.com/auth/analytics.readonly'];
    
    //function AsignarClientId(clientId){
    //    CLIENT_ID=clientId;
    //}

    
    /*
 * Note: This code assumes you have an authorized Analytics client object.
 * See the View (Profile) Developer Guide for details.
 */

/*
 * This request gets an existing view (profile).
 */


  function authorize(event) {
    // Handles the authorization flow.
    // `immediate` should be false when invoked from the button click.
    var useImmdiate = event ? false : true;
    var authData = {
      client_id: CLIENT_ID,
      scope: SCOPES,
      immediate: useImmdiate
    };

    gapi.auth.authorize(authData, function(response) {
      var authButton = document.getElementById('auth-button');
      if (response.error) {
        authButton.hidden = false;
      }
      else {
        authButton.hidden = true;
        queryAccounts();
      }
    });
  }


function queryAccounts() {
  // Load the Google Analytics client library.
  gapi.client.load('analytics', 'v3').then(function() {

    // Get a list of all Google Analytics accounts for this user
    gapi.client.analytics.management.accounts.list().then(handleAccounts);
  });
}


function handleAccounts(response) {
  // Handles the response from the accounts list method.
  if (response.result.items && response.result.items.length) {
    // Get the first Google Analytics account.
    var firstAccountId = response.result.items[0].id;

    // Query for properties.
    queryProperties(firstAccountId);
  } else {
    console.log('No accounts found for this user.');
  }
}


function queryProperties(accountId) {
  // Get a list of all the properties for the account.
  gapi.client.analytics.management.webproperties.list(
      {'accountId': accountId})
    .then(handleProperties)
    .then(null, function(err) {
      // Log any errors.
      console.log(err);
  });
}


function handleProperties(response) {
  // Handles the response from the webproperties list method.
  if (response.result.items && response.result.items.length) {

    // Get the first Google Analytics account
    var firstAccountId = response.result.items[0].accountId;

    // Get the first property ID
    var firstPropertyId = response.result.items[0].id;

    // Query for Views (Profiles).
    queryProfiles(firstAccountId, firstPropertyId);
  } else {
    console.log('No properties found for this user.');
  }
}


function queryProfiles(accountId, propertyId) {
  // Get a list of all Views (Profiles) for the first property
  // of the first Account.
  gapi.client.analytics.management.profiles.list({
      'accountId': accountId,
      'webPropertyId': propertyId
  })
  .then(handleProfiles)
  .then(null, function(err) {
      // Log any errors.
      console.log(err);
  });
}


function handleProfiles(response) {
  // Handles the response from the profiles list method.
  if (response.result.items && response.result.items.length) {
    // Get the first View (Profile) ID.
    var firstProfileId = response.result.items[0].id;

    // Query the Core Reporting API.
    //queryCoreReportingApi(firstProfileId);
    
    //getView();
	//mostrarInfo();
  } else {
    console.log('No views (profiles) found for this user.');
  }
}




    


function queryCoreReportingApi(pID,finicio,ffinal) {
  
  //para recibir el profile id por el text field
  debugger;
  //var pID=document.getElementById("<portlet:namespace/>profileId").value;
  //var finicio=document.getElementById("<portlet:namespace/>finicio").value;
  //var ffinal=document.getElementById("<portlet:namespace/>ffinal").value;
  debugger;
  //Sistemas Operativos
  gapi.client.analytics.data.ga.get({
    'ids': 'ga:'+ pID,
    'start-date': finicio,
    'end-date': ffinal,
    'metrics': 'ga:sessions',
    'dimensions': 'ga:operatingSystem'
  })
  .then(function(response) {
    var formattedJson = JSON.stringify(response.result, null, 2);
    var res=JSON.parse(formattedJson);
    //ver json en el text area
    document.getElementById('query-output').value = formattedJson;
    var sessions = res.totalsForAllResults['ga:sessions'];
    var SOS = res.rows;
    document.getElementById('<portlet:namespace/>sessions').value = sessions;
    document.getElementById('<portlet:namespace/>sos').value = SOS;
    continuar1=false;
  })
  .then(null, function(err) {
      // Log any errors.
      console.log(err);
  });
  
//Paises
  gapi.client.analytics.data.ga.get({
    'ids': 'ga:'+ pID,
    'start-date': finicio,
    'end-date': ffinal,
    'metrics': 'ga:sessions',
    'dimensions': 'ga:country',
    'sort': '-ga:sessions'
  })
  .then(function(response) {
    var formattedJson = JSON.stringify(response.result, null, 2);
    var res=JSON.parse(formattedJson);
    var paises = res.rows;
    document.getElementById('<portlet:namespace/>country').value = paises;
  })
  .then(null, function(err) {
      // Log any errors.
      console.log(err);
  });
  
//Ciudades
  gapi.client.analytics.data.ga.get({
    'ids': 'ga:'+ pID,
    'start-date': finicio,
    'end-date': ffinal,
    'metrics': 'ga:sessions',
    'dimensions': 'ga:city',
    'sort': '-ga:sessions'
  })
  .then(function(response) {
    var formattedJson = JSON.stringify(response.result, null, 2);
    var res=JSON.parse(formattedJson);
    var ciudades = res.rows;
    document.getElementById('<portlet:namespace/>city').value = ciudades;
  })
  .then(null, function(err) {
      // Log any errors.
      console.log(err);
  });
//Browser
  gapi.client.analytics.data.ga.get({
    'ids': 'ga:'+pID,
    'start-date': finicio,
    'end-date': ffinal,
    'metrics': 'ga:sessions',
    'dimensions': 'ga:browser',
    'sort': '-ga:sessions'
  })
  .then(function(response) {
    var formattedJson = JSON.stringify(response.result, null, 2);
    var res=JSON.parse(formattedJson);
    var browser = res.rows;
    document.getElementById('<portlet:namespace/>browser').value = browser;
  })
  .then(null, function(err) {
      // Log any errors.
      console.log(err);
  });
  
  
}
    
    function getView() {
  var request = gapi.client.analytics.management.profiles.get({
    'accountId': '65674821',
    'webPropertyId': 'UA-65674821-1',
    'profileId': '105938628',
  });
  request.execute(function (response) { 
    var formattedJson = JSON.stringify(response.result, null, 2);
    document.getElementById('query-output').value = formattedJson;
  });
}

  // Add an event listener to the 'auth-button'.
  document.getElementById('auth-button').addEventListener('click', authorize);
  
  
  
  
	function beforeSubmit(PID, email){
		debugger;
		queryCoreReportingApi(PID);
		document.getElementById('<portlet:namespace/>txtemail').value = email;
		debugger;
		//while(continuar1){}
			
		
		//document.getElementById("analyticsForm").submit();
		setTimeout(function(){document.getElementById("analyticsForm").submit();}, 2000);
		//after();
	}
	function beforeSubmit2(PID, email, finicio, ffinal){
		debugger;
		queryCoreReportingApi(document.getElementById('<portlet:namespace/>profileId').value, finicio, ffinal);
		document.getElementById('<portlet:namespace/>txtemail').value = email;
		debugger;
		//while(continuar1){}
			
		
		//document.getElementById("analyticsForm").submit();
		setTimeout(function(){document.getElementById("analyticsForm").submit(function(){return true;});}, 2000);
		//after();
	}
	function after(){
		debugger;
		if(document.getElementById('<portlet:namespace/>browser').value != ""){
			document.getElementById("analyticsForm").submit();
		}
		else{
			after();
		}
		
	}
	
	
	function automatico(){
		debugger;
		<% 
        Connection connection = DriverManager.getConnection(
            "jdbc:mysql://localhost/DBLiferay", "root", "1234");

        Statement statement = connection.createStatement() ;
        ResultSet rs = 
            statement.executeQuery("select * from cliente") ; 
        
        while (rs.next()){ %>
        	
        	beforeSubmit2( "<%=rs.getString(8)%>" , "<%= rs.getString(3) %>", document.getElementById('<portlet:namespace/>finicio').value, document.getElementById('<portlet:namespace/>ffinal').value );
        	console.log('<%=rs.getString(8)%>');
        <% } %>
    
	}
 
  
  
</script>

<script src="https://apis.google.com/js/client.js?onload=authorize"></script>


<% 
            Connection connection2 = DriverManager.getConnection(
                "jdbc:mysql://localhost/DBLiferay", "root", "1234");

            Statement statement2 = connection2.createStatement() ;
            ResultSet rs2 = 
                statement2.executeQuery("select * from cliente") ; 
        %>


<div class="container"> 
	<form action="<%=addAnalyticsActionURL%>" name="analyticsForm" id="analyticsForm" method="POST">
		<div class="form-group">
			<label for="profileId">Profile Id</label> 
			
			<select class="form-control" id="<portlet:namespace/>profileId" name="<portlet:namespace/>profileId">
			  <% while(rs2.next()){ %>
			  <option value="<%=rs2.getString(8)%>"><%=rs2.getString(8)%></option>
			  <% } %>
			</select>
			
			<!--  <input type="text" class="form-control" id="<portlet:namespace/>profileId" name="<portlet:namespace/>profileId">--> 
		</div>
		<div class="form-group" >
			<label for="txtemail">Email</label> 
			<input type="email" class="form-control" id="<portlet:namespace/>txtemail" name="<portlet:namespace/>txtemail" required>
		</div>
		<div class="form-group">
			<label for="finicio">Inicio</label> 
			<input type="date" class="form-control" id="<portlet:namespace/>finicio" name="<portlet:namespace/>finicio"> 
		</div>
		<div class="form-group">
			<label for="ffinal">Final</label> 
			<input type="date" class="form-control" id="<portlet:namespace/>ffinal" name="<portlet:namespace/>ffinal"> 
		</div>
		<button type="button" name="btnAddAnalytics" id="btnAddAnalytics" onclick="beforeSubmit()"> Mostrar </button>
		<input type="submit" name="addAnalytics" id="addAnalytics" value="Prueba"/>
		<div class="form-group">
			<textarea cols="80" rows="20" id="query-output"></textarea>
		</div>
		<div>
			<input type="hidden" class="form-control" id="<portlet:namespace/>sessions" name="<portlet:namespace/>sessions">
			<input type="hidden" class="form-control" id="<portlet:namespace/>country" name="<portlet:namespace/>country">
			<input type="hidden" class="form-control" id="<portlet:namespace/>city" name="<portlet:namespace/>city">
			<input type="hidden" class="form-control" id="<portlet:namespace/>browser" name="<portlet:namespace/>browser">
			<input type="hidden" class="form-control" id="<portlet:namespace/>sos" name="<portlet:namespace/>sos">
		</div>
		<button type="button" name="btnAutomatico" id="btnAutomatico" onclick="automatico()"> Enviar a todos </button>
	
	</form>
</div>

</body>
</html>