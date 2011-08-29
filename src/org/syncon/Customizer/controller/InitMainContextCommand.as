package org.syncon.Customizer.controller
{
	import flash.events.Event;
	
	import org.robotlegs.mvcs.Command;
	import org.syncon.Customizer.model.NightStandModel;
	import org.syncon.Customizer.vo.FaceVO;
	import org.syncon.Customizer.vo.ImageVO;
	import org.syncon.Customizer.vo.StoreItemVO;
	import org.syncon2.utils.MakeVOs;
	import org.syncon.Customizer.vo.TextLayerVO;
	import org.syncon.Customizer.vo.ImageLayerVO;
	
	/**
	 *
	 * */
	public class InitMainContextCommand extends Command
	{
		[Inject] public var model:NightStandModel;
		[Inject] public var event:InitMainContextCommandTriggerEvent;
		
		override public function execute():void
		{
			if ( event.type == InitMainContextCommandTriggerEvent.INIT ) 
			{
				this.model.showAds = event.showAds
				this.model.flex = event.flex; 
				
				if ( this.model.flex == false ) 
				{
					/*	airFeatures = new AirFeaturesClass()*/
					/*	airFeatures.disableKeyLock(); */
				}
			}
			if ( event.type == InitMainContextCommandTriggerEvent.INIT2 ) 
			{
				if ( this.model.flex == false ) 
				{
					/*AirFeaturesClass['stage'] = this.contextView.stage*/
					//airFeatures.goIntoFullscreenMode(); 
				}
			}	
			if ( event.type == InitMainContextCommandTriggerEvent.SET_MULTIPLER ) 
			{
				if ( this.model.flex == false ) 
				{
					this.model.multipler = event.data as Number
				}
			}	
			
			if ( event.type == InitMainContextCommandTriggerEvent.INIT3_MAKEUP_FLEX_DATA ) 
			{
				this.createDefaultProduct() ; 
				this.createClipArtImages(); 
				this.createDetailedDefaultProduct();
				if ( this.model.flex ) 
				{
					
				}
			}	
			
			if ( event.type == InitMainContextCommandTriggerEvent.EXIT_APP ) 
			{
				if ( this.model.flex == false ) 
				{
				}
			}
			
			
		}
		
		private function createClipArtImages():void
		{
			var names : Array = [] ; 
			for  (var i : int = 0 ; i < 150; i++ )
			{
				names.push( 'Title ' + i.toString() ) ; 
			}
			var imgs : Array = MakeVOs.makeObjs( names, ImageVO, 'name' )
			for each ( var img : ImageVO in imgs ) 
			{
				img.url = 'assets/images/img.jpg'; 
			}
			this.model.loadImages( imgs ) ; 
		}
		
		private function createDefaultProduct():void
		{
			var base : StoreItemVO = new StoreItemVO(); 
			base.name = 'Zippo'
			var face : FaceVO = new FaceVO()
			
			face.base_image_url = 'assets/images/imgbase.png'
			base.faces.addItem( face ) 
			this.model.baseItem = base; 
			
			/*var l :  Array = [] ; 
			l = MakeVOs.makeObjs(['L1', 'L2'], LessonVO, 'name' )
			var lp : LessonGroupVO = new LessonGroupVO(); 
			lp.lessons = new ArrayList( l ) ; 
			//this.model.loadLessons( l ); 
			
			var firstLesson : LessonVO = lp.lessons.getItemAt( 0 ) as LessonVO
			l =  MakeVOs.makeObjs(['Ls1', 'Ls2', 'Ls3'], LessonSetVO, 'name' )
			firstLesson.sets = new ArrayList( l ) ; 
			
			var set : LessonSetVO = firstLesson.sets.getItemAt( 0 ) as LessonSetVO
			l =  MakeVOs.makeObjs(['dog', '2', '3','4'], LessonItemVO, 'name' )
			set.items = new ArrayList( l ) ; 					
			
			this.model.currentLessonPlan =  lp ; */
		}		
		
		
		private function createDetailedDefaultProduct():void
		{
			var base : StoreItemVO = new StoreItemVO(); 
			base.name = 'Zippo'
			var face : FaceVO = new FaceVO()
			
			face.base_image_url = 'assets/images/imgbase.png'
			base.faces.addItem( face ) 
			
			
			
			var textLayer: TextLayerVO = new TextLayerVO;
			textLayer.text = 'Add Text' 
				textLayer.name = 'Text'
			textLayer.prompt_layer = true; 
			face.layersToImport.push(textLayer);
			var imageLayer: ImageLayerVO
			
		 
			imageLayer = new ImageLayerVO;
			imageLayer.name = 'Upload'
			imageLayer.url ='assets/images/pokemon.png'
			imageLayer.prompt_layer = true; 
			imageLayer.image_source = 'upload';  	
			face.layersToImport.push(imageLayer);
			 
			imageLayer = new ImageLayerVO;
			imageLayer.url = ''
			imageLayer.visible = false; 
			imageLayer.prompt_layer = true; 
			imageLayer.image_source = 'clipart';  			
			face.layersToImport.push(imageLayer);
			
			imageLayer = new ImageLayerVO;
			//imageLayer.url = ''
			imageLayer.prompt_layer = true; 
			imageLayer.visible = false; 
			imageLayer.image_source = 'clipart';  						
			face.layersToImport.push(imageLayer);
			
			imageLayer = new ImageLayerVO;
			imageLayer.prompt_layer = true; 			
			imageLayer.image_source = 'clipart';  		
			imageLayer.url ='assets/images/img.jpg'
			imageLayer.visible = false; 
			face.layersToImport.push(imageLayer);
			
			/*var l :  Array = [] ; 
			l = MakeVOs.makeObjs(['L1', 'L2'], LessonVO, 'name' )
			var lp : LessonGroupVO = new LessonGroupVO(); 
			lp.lessons = new ArrayList( l ) ; 
			//this.model.loadLessons( l ); 
			
			var firstLesson : LessonVO = lp.lessons.getItemAt( 0 ) as LessonVO
			l =  MakeVOs.makeObjs(['Ls1', 'Ls2', 'Ls3'], LessonSetVO, 'name' )
			firstLesson.sets = new ArrayList( l ) ; 
			
			var set : LessonSetVO = firstLesson.sets.getItemAt( 0 ) as LessonSetVO
			l =  MakeVOs.makeObjs(['dog', '2', '3','4'], LessonItemVO, 'name' )
			set.items = new ArrayList( l ) ; 					
			
			this.model.currentLessonPlan =  lp ; */
			
			this.model.baseItem = base; 
		}		
		
		
		
		
	}
}