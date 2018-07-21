<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
		/* 페이스북 로그인 시작 */
		window.fbAsyncInit = function() {
		    FB.init({
		      appId      : '998514066870295',
		      cookie     : true,  // enable cookies to allow the server to access the session
		      xfbml      : true,  // parse social plugins on this page
		      version    : 'v2.5' // use graph api version 2.5
		    });
		};
		
		(function(d, s, id) {
		  var js, fjs = d.getElementsByTagName(s)[0];
		  if (d.getElementById(id)) return;
		  js = d.createElement(s); js.id = id;
		  js.src = "//connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.5&appId=996133133775055";
		  fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
		
		function Login() {
	        FB.login(function(response) {
	            if (response.authResponse) {
	              console.log('Welcome!  Fetching your information.... ');
	              console.log("response");
	              console.log(response);

	              FB.api(
	               '/me','GET',
	               {"fields":"about,location,email,birthday,name,id"},
	               function(response) {
	                   console.log(response.id);  // id
	                   console.log(response.email); // email
	                   console.log(response.name);  // name
	                   console.log(response.birthday);  // birthday
	                   
	                   location.href='fbinfo.do?userid='+response.id+"&email="+response.email+"&name="+response.name+"&birth="+response.birthday;
	              });
	            } else {
	             console.log('User cancelled login or did not fully authorize.');
	            }
	        }, {scope: 'email, user_birthday'});
	      }

		function Logout(){

			FB.getLoginStatus(function(response){ // get Login Status for logout.

				if (response.status === 'connected') {
					console.log('FB Logout');
					FB.logout(function(request){
						console.log('Successfully logged out!');
						location.href='/WeSafer/logout.do';
					});
				} else {
					console.log('일반 유저 로그아웃');
					location.href='/WeSafer/logout.do';
				}
	   		});
		}
		function link(){
			
		}
	</script>

