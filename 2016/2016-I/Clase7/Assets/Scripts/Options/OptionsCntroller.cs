using UnityEngine;
using System.Collections;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class OptionsCntroller : MonoBehaviour {

	// Use this for initialization
	public Button easy, medium, hard, back;
	private Button soundOn, soundOff;
	public GameObject soundOnGO, soundOffGO, check;
	public Transform easyPos, mediumPos,hardPos;
	void Start () {
		soundOn = soundOnGO.GetComponent<Button> ();
		soundOff = soundOffGO.GetComponent<Button> ();
		soundOn.onClick.AddListener (() => deactivateSound ());
		soundOff.onClick.AddListener (() => activateSound ());
		check.SetActive (false);
		easy.onClick.AddListener (() => changeOptions (easyPos,"easy"));
		medium.onClick.AddListener (() => changeOptions (mediumPos,"medium"));
		hard.onClick.AddListener (() => changeOptions (hardPos,"hard"));
		soundOffGO.SetActive (false);
		back.onClick.AddListener (() => goBack ());
	}

	void goBack(){
		back.onClick.RemoveAllListeners ();
		SceneManager.LoadScene ("Menu");
	}

	void changeOptions(Transform pos,string buttonName){
		if (!check.activeInHierarchy) {
			check.SetActive (true);
		}
		check.transform.position = pos.position;
	}

	void activateSound(){
		soundOnGO.SetActive (true);
		soundOffGO.SetActive (false);
	}
	
	void deactivateSound(){
		soundOnGO.SetActive (false);
		soundOffGO.SetActive (true);
	}
}

