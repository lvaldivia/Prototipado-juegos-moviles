using UnityEngine;
using System.Collections;

public class BgScaler : MonoBehaviour {

	void Start () {
		float height = Camera.main.orthographicSize * 2f;
		float width = height * Screen.width / Screen.height;
		if (gameObject.name == "background") {
			transform.localScale = new Vector3 (width, height, 0);	
		}else if(gameObject.name =="floor"){
			transform.localScale = new Vector3 (width, 5f, 0);
		}
	}

}
