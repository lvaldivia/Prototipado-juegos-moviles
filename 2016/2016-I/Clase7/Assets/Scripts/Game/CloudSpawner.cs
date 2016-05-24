using UnityEngine;
using System.Collections;

public class CloudSpawner : MonoBehaviour {

	// Use this for initialization
	[SerializeField]
	private GameObject[] clouds;
	[HideInInspector]
	public float distanceToCloud = 3f;
	float minX,maxX;
	GameObject player;
	float lastPositionY;

	void Start () {
		player = GameObject.Find ("Player");
		setBoundsXY ();
		shuffleClouds ();
		spawnClouds ();
		positionPlayer ();
	}	

	void setBoundsXY(){
		Vector3 bounds = Camera.main.ScreenToWorldPoint (new Vector3 (
			                 Screen.width, Screen.height, 0));
		maxX = bounds.x - 0.5f;
		minX = -bounds.x + 0.5f;
	}
		
	void shuffleClouds(){
		for(int i =0;i<clouds.Length;i++){
			GameObject cloud = clouds [i];
			int random = Random.Range (i, clouds.Length);
			clouds [i] = clouds [random];
			clouds [random] = cloud;
		}
	}

	void spawnClouds(){
		float nextPositionY = 0f;
		for(int i=0;i<clouds.Length;i++){
			float posX = Random.Range (minX, maxX);
			Vector3 tmp = clouds [i].transform.position;
			tmp.x = posX;
			tmp.y = nextPositionY;
			lastPositionY = tmp.y;
			nextPositionY -= distanceToCloud;
			clouds [i].transform.position = tmp;
		}
	}

	void positionPlayer(){
		GameObject[] dark = GameObject.FindGameObjectsWithTag ("Deadly");
		GameObject[] goods = GameObject.FindGameObjectsWithTag ("Cloud");

		for(int i=0;i<dark.Length;i++){
			if (dark [i].transform.position.y == 0f) {
				Vector3 t = dark [i].transform.position;
				dark [i].transform.position = 
					new Vector3 (goods [0].transform.position.x,
					goods [0].transform.position.y,
					goods [0].transform.position.z);
				goods [0].transform.position = t;
			}
		}
		Vector3 tmp = goods [0].transform.position;
		for(int i = 1;i<goods.Length;i++){
			if (tmp.y > goods [i].transform.position.y) {
				tmp = goods [i].transform.position;
			}
		}
		print (tmp);
		tmp.y += 0.8f;
		player.transform.position = tmp;

	}


	void OnTriggerEnter2D(Collider2D coll){
		if (coll.gameObject.tag == "Cloud" ||
		   coll.gameObject.tag == "Deadly") {
			GameObject go = coll.gameObject;
			Vector3 tmp = go.transform.position;
			print (go.transform.position.y + " " + lastPositionY);
			if (go.transform.position.y >= lastPositionY) {
				for(int i = 0;i<clouds.Length;i++){
					if(!clouds[i].activeInHierarchy){
						clouds [i].SetActive (true);
						float posX = Random.Range (minX, maxX);
						tmp.x = posX;
						tmp.y -= distanceToCloud;
						lastPositionY = tmp.y;
						print (tmp);
						clouds [i].transform.position = tmp;
					}
				}
			}
		}
	}
}
