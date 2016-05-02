using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class MonsterController : MonoBehaviour {

	public GameObject[] elements;
	List<GameObject> monsters;
	float elapsed;
	float creationTime;
	void Start () {
		monsters = new List<GameObject> ();
		initMonsters();
		creationTime = Random.Range (1.5f, 4.5f);
		elapsed = 0;
	}

	void initMonsters(){
		int total = elements.Length * 5;
		for(int i = 0;i<total;i++){
			int index = Random.Range (0, elements.Length);
			GameObject go = Instantiate (elements [index],
				                transform.position, 
				transform.rotation) as GameObject;
			monsters.Add (go);
			go.SetActive (false);
			
		}
	}
	
	// Update is called once per frame
	void Update () {
		elapsed += Time.deltaTime;
		if (elapsed >= creationTime) {
			creationTime = Random.Range (1.5f, 4.5f);
			elapsed = 0;
			callMonster ();
		}
	}

	void callMonster(){
		int index = Random.Range (0, monsters.Count);
		while (true) {
			if (!monsters [index].activeInHierarchy) {
				monsters [index].SetActive (true);
				monsters [index].transform.position = 
					new Vector3 (transform.position.x,
					transform.position.y, transform.position.z);
				break;
			} else {
				index = Random.Range (0, monsters.Count);
			}	
		}

	}
}
