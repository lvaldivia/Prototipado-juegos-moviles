using UnityEngine;
using System.Collections;

public class PlayerAnimation : MonoBehaviour {

	// Use this for initialization
	Animator anim;
	void Start () {
		//anim = GetComponent<Animator> ();
		//anim.Play ("running");
	}

	public void playAnimation(string state){
		anim.Play (state);
	}
	
	// Update is called once per frame
	void Update () {
	
	}
}
