using UnityEngine;
using System.Collections;
using Facebook.Unity;
using System.Collections.Generic;
using Utils;
using UnityEngine.SceneManagement;

public class FacebookController : MonoBehaviour {

	// Use this for initialization
	public GameObject loadingPanel;
	List<string> perms;
	void Start () {
		perms = new List<string> ();
		perms.Add ("public_profile");
		perms.Add ("email");
		GameSettings.user = new User ();
		loadingPanel.SetActive (false);
		if(!FB.IsInitialized){
			FB.Init(onInit,onHideUnity);
		}
	}

	void onInit(){
		FB.ActivateApp ();
	}

	void onHideUnity(bool gameIsShown){
		if (gameIsShown) {
			Time.timeScale = 1f;
		} else {
			Time.timeScale = 0f;
		}
	}


	public void login(){
		loadingPanel.SetActive (true);
		FB.LogInWithReadPermissions (perms, onLoginComplete);
	}

	void onLoginComplete(ILoginResult result){
		if (FB.IsLoggedIn) {
			FB.API ("/me?fields=first_name,last_name,email", 
				HttpMethod.GET, onDataComplete);
			FB.API("/me/picture?type=square&width=128&height=128",
					HttpMethod.GET,onPicComplete);
		} else {
			loadingPanel.SetActive (false);
		}
	}

	void onPicComplete(IGraphResult result){
		GameSettings.user.profile_pic = result.Texture;
		SceneManager.LoadScene ("Game");
	}

	void onDataComplete(IResult result){
		GameSettings.user.first_name = 
			(string)result.ResultDictionary ["first_name"];
		GameSettings.user.last_name = 
			(string)result.ResultDictionary ["last_name"];
	}
}
