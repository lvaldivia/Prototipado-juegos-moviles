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
	int controllX;

	void Start () {
		player = GameObject.Find ("Player");
		setBoundsXY ();
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
		

	void spawnClouds() {
		shuffleClouds ();
		float positionY = 0;

		for(int i = 0; i < clouds.Length; i++) {

			Vector3 temp = clouds[i].transform.position;

			temp.y = positionY;

			if(controllX == 0) {

				temp.x = Random.Range(0, maxX);
				controllX = 1;

			} else if(controllX == 1) {

				temp.x = Random.Range(0, minX);
				controllX = 2;

			} else if(controllX == 2) {

				temp.x = Random.Range(1.0f, maxX);
				controllX = 3;

			} else if(controllX == 3) {

				temp.x = Random.Range(-1.0f, minX);
				controllX = 0;
			}

			lastPositionY = positionY;

			clouds[i].transform.position = temp;
			positionY -= distanceToCloud;

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
			if (tmp.y < goods [i].transform.position.y) {
				tmp = goods [i].transform.position;
			}
		}
		tmp.y += 0.8f;
		player.transform.position = tmp;

	}


	void OnTriggerEnter2D(Collider2D target) {

		if (target.tag == "Deadly" || target.tag == "Cloud") {

			if(target.transform.position.y == lastPositionY) {

				Vector3 temp = target.transform.position;
				shuffleClouds();

				for(int i = 0; i < clouds.Length; i++) {

					if(!clouds[i].activeInHierarchy) {

						if(controllX == 0) {

							temp.x = Random.Range(0, maxX);
							controllX = 1;

						} else if(controllX == 1) {

							temp.x = Random.Range(0, minX);
							controllX = 2;

						} else if(controllX == 2) {

							temp.x = Random.Range(1.0f, maxX);
							controllX = 3;

						} else if(controllX == 3) {

							temp.x = Random.Range(-1.0f, minX);
							controllX = 0;
						}

						temp.y -= distanceToCloud;

						lastPositionY = temp.y;


						clouds[i].transform.position = temp;
						clouds[i].SetActive(true);
					}

				}

			}

		} 

	}
}
