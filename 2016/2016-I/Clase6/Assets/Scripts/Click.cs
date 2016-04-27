using UnityEngine;
using System.Collections;
using UnityEngine.UI;
using UnityEngine.EventSystems;

public class Click : MonoBehaviour, IPointerDownHandler, IPointerUpHandler {

	// Use this for initialization
	void Start () {
	}

	public void OnPointerDown(PointerEventData data){
		print (gameObject.name + " was down");
	}

	public void OnPointerUp(PointerEventData data){
		print (gameObject.name + " was up");
	}
		
}
