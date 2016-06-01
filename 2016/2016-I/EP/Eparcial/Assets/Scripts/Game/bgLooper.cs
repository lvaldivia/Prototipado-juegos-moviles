using UnityEngine;
using System.Collections;

public class bgLooper : MonoBehaviour {

	// Use this for initialization
	Vector2 offset;
	Material mat;
	float speed = 0.2f;
	void Start () {
		mat = GetComponent<Renderer> ().material;
		offset = mat.GetTextureOffset ("_MainTex");
	}
	
	// Update is called once per frame
	void Update () {
		offset.y += speed * Time.deltaTime;
		mat.SetTextureOffset ("_MainTex", offset);
	}
}
