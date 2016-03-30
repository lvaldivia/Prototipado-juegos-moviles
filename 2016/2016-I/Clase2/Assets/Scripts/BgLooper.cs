using UnityEngine;
using System.Collections;

public class BgLooper : MonoBehaviour {

	Material mat;
	public float speed;
	Vector2 offset;
	void Start () {
		mat = GetComponent<Renderer> ().material;
		offset = mat.GetTextureOffset ("_MainTex");
	}
	
	// Update is called once per frame
	void Update () {
		offset.x += speed * Time.deltaTime;
		mat.SetTextureOffset ("_MainTex", offset);
	}
}
