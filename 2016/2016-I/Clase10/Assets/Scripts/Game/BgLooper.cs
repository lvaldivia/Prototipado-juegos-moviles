using UnityEngine;
using System.Collections;

public class BgLooper : MonoBehaviour {

	Material mat;
	Vector3 offset;
	float speed = 0.25f;
	void Start () {
		mat = GetComponent<Renderer> ().material;
		offset = mat.GetTextureOffset ("_MainTex");
	}

	void Update () {
		offset.y += speed * Time.deltaTime;
		mat.SetTextureOffset ("_MainTex", offset);
	}
}
