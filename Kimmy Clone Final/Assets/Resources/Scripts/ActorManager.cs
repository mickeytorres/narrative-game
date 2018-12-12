using System.Collections;
using UnityEngine;

namespace Resources.Scripts
{
	public class ActorManager : MonoBehaviour
	{

		public Sprite[] CharSprites;
		private SpriteRenderer _spRend;
		public int ID; // Left = 0, Right = 1
	
		public enum WhichCharacter
		{
			Amber, Anthony, Dana, Donna, Dean, Kimmy, KimmyMom, Mom
		}


		[SerializeField] 
		WhichCharacter _whatSprite;
	
		void Awake ()
		{

			_whatSprite = WhichCharacter.Dana;
			_spRend = GetComponent<SpriteRenderer>();

		}

		public void ChangeChar(string spriteName)
		{
			StartCoroutine(spriteName);

		}

		IEnumerator Dana()
		{
			_spRend.sprite = CharSprites[0];
			_whatSprite = WhichCharacter.Dana;
			yield return null;
		}
	
		IEnumerator Kimmy()
		{
			_spRend.sprite = CharSprites[1];
			_whatSprite = WhichCharacter.Kimmy;

			yield return null;
		}
	
		IEnumerator KimmyMom()
		{
			_spRend.sprite = CharSprites[2];
			_whatSprite = WhichCharacter.KimmyMom;

			yield return null;
		}
	
		IEnumerator Mom()
		{
			_spRend.sprite = CharSprites[3];
			_whatSprite = WhichCharacter.Mom;

			yield return null;
		}
	
		IEnumerator Dean()
		{
			_spRend.sprite = CharSprites[4];
			_whatSprite = WhichCharacter.Dean;

			yield return null;
		}
	
		IEnumerator Donna()
		{
			_spRend.sprite = CharSprites[5];
			_whatSprite = WhichCharacter.Donna;

			yield return null;
		}
	
		IEnumerator Anthony()
		{
			_spRend.sprite = CharSprites[6];
			_whatSprite = WhichCharacter.Anthony;

			yield return null;
		}
	
		IEnumerator Amber()
		{
			_spRend.sprite = CharSprites[7];
			_whatSprite = WhichCharacter.Amber;

			yield return null;
		}
	
	
	}
}
