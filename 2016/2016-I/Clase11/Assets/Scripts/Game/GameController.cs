using UnityEngine;
using System.Collections;
using UnityEngine.UI;

public class GameController : MonoBehaviour {

	public Button share;
	public string TWITTER_INTENT = "http://twitter.com/intent/tweet";
	public string TWITTER_LANG = "en";
	void Start () {
		share.onClick.AddListener (() => shareTwitter ());
	}

	void shareTwitter(){
		Application.OpenURL(TWITTER_INTENT+"?text="+WWW.EscapeURL("HOLI :D")+
			"&amp;lang="+WWW.EscapeURL(TWITTER_LANG));
	}
	
	// Update is called once per frame
	void Update () {
	
	}
}
