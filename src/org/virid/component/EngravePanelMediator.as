package  org.virid.component
{
	import flash.events.Event;
	
	import flashx.undo.IOperation;
	
	import mx.collections.ArrayCollection;
	import mx.collections.ArrayList;
	
	import org.robotlegs.mvcs.Mediator;
	import org.syncon.Customizer.controller.EditProductCommandTriggerEvent;
	import org.syncon.Customizer.model.CustomEvent;
	import org.syncon.Customizer.model.NightStandModel;
	import org.syncon.Customizer.model.NightStandModelEvent;
	import org.syncon.Customizer.view.ui.Toolbar;
	import org.syncon.Customizer.vo.FontVO;
	import org.syncon.Customizer.vo.ImageVO;
	import org.syncon.Customizer.vo.ItemRendererHelpers;
	import org.syncon.Customizer.vo.LayerBaseVO;
	import org.syncon.Customizer.vo.TextLayerVO;
	import org.syncon.popups.controller.ShowPopupEvent;
	
	public class  EngravePanelMediator extends Mediator 
	{
		[Inject] public var ui : engrave_panel;
		[Inject] public var model : NightStandModel;
		
		override public function onRegister():void
		{
			/*this.ui.addEventListener( engrave_panel.ADD_TEXT,  this.onAddText);	
			this.ui.addEventListener( MainMenuBar.ADD_IMAGE,  this.onAddImage);	
			this.ui.addEventListener( MainMenuBar.UNDO,  this.onUndo);	
			this.ui.addEventListener( MainMenuBar.REDO,  this.onRedo);	
			
			eventMap.mapListener(eventDispatcher, NightStandModelEvent.UNDOS_CHANGED, 
				this.checkUndoButtons);	
			this.checkUndoButtons(); 
			*/
			/*
			eventMap.mapListener(eventDispatcher, NightStandModelEvent.BASE_ITEM_CHANGED, 
				this.onLoadLocations);	
			this.onLoadLocations(); */

			this.ui.addEventListener( engrave_panel.CHANGED_TEXT, 
				this.onTextChanged );	
			
			this.ui.addEventListener( LayerTextInspector.DATA_CHANGED, 
				this.onDataChanged );	
			onDataChanged(null)
			
			
			this.ui.addEventListener( LayerTextInspector.CHANGE_FONT_FAMILY, 
				this.onFontChanged );	
			//onFontChanged(null)
		}
		
		protected function onTextChanged(event:Event):void
		{
			this.model.calculateProductPrice();
			
		}
		public var layer : TextLayerVO = new TextLayerVO(); 
		private function onFontChanged(event: CustomEvent):void
		{
			var font : FontVO= event.data as FontVO
			var fontName : String = font.name; 
			if ( font.swf_name != null && font.swf_name != '' ) 
				fontName = font.swf_name; 
			/*
			this.dispatch( new EditProductCommandTriggerEvent ( 
				EditProductCommandTriggerEvent.CHANGE_FONT_FAMILY, fontName 
			) )  
				*/
			this.dispatch( new EditProductCommandTriggerEvent ( 
				EditProductCommandTriggerEvent.CHANGE_FONT_FAMILY_PRODUCT, fontName 
			) )  
		}
		public var s : ItemRendererHelpers = new ItemRendererHelpers(null)
		protected function onDataChanged(event:Event):void
		{
			layer = this.ui.layer as TextLayerVO
			s.listenForObj( layer, LayerBaseVO.UPDATED, this.onUpdatedLayer ) ; //we have to 
			//do this so we can catch it the first time ...  it if was not set initially 
			this.updateFontList(); 
		}
		
		private function onUpdatedLayer(e:Event=null):void
		{
			if ( layer == null ) 
				return; 
 
				if ( this.layer.propChanged == 'fontFamily' )
				{
					this.updateFontList(); 
				}
		}
		
		private function updateFontList():void
		{
			var fonts : Array = this.ui.layer.fonts; 
			//y do this 
			//this.ui.dropDown_FontSelect.labelFunction = this.labelForDropDown; 
			this.ui.dropDown_FontSelect.labelField = 'name' ; 
			this.ui.dropDown_FontSelect.dataProvider = new ArrayList( fonts ) ; 
			var foundFound : FontVO; 
			for each ( var f : FontVO in fonts ) 
			{
				if ( f.name ==  this.ui.layer.fontFamily )
				{
					foundFound = f; 	
				}
				if ( f.swf_name != null && f.swf_name ==  this.ui.layer.fontFamily )
				{
					foundFound = f; 	
				}
				
			}
			this.ui.dropDown_FontSelect.selectedItem = foundFound; //this.ui.layer.fontFamily; 
			
		}
		
		public function labelForDropDown( f : FontVO ) :  String
		{
			return f.name; 
		}
		/*
		private function onLoadLocations(e:Event=null):void
		{
			this.ui.list.dataProvider = new ArrayCollection( this.model.locations ) ; 
			
		}*/
		
	/*	
		protected function onRedo(event:Event):void
		{
			// TODO Auto-generated method stub
			var op : IOperation = this.model.undo.popRedo()
			op.performRedo()
			this.model.undo.pushUndo( op ) ; 
			//this.model.undo.redo(); 
			this.checkUndoButtons()
		}
		
		protected function onUndo(event:Event):void
		{
			// TODO Auto-generated method stub
			//	this.model.undo.undo()
			var op : IOperation = this.model.undo.popUndo()
			op.performUndo()
			this.model.undo.pushRedo( op ) ; 
			this.checkUndoButtons()
		}
		
		private function checkUndoButtons(e:Event=null):void
		{
			var dbg : Array = [this.model.undo.canUndo()] 
			//this.ui.btnRedo.enabled = this.model.undo.canRedo() 
			this.ui.btnUndo.enabled = this.model.undo.canUndo() 
		}
		
		private function onAddText(e:  CustomEvent): void
		{
			var obj : Object = e.data
			this.dispatch( new EditProductCommandTriggerEvent (
				EditProductCommandTriggerEvent.ADD_TEXT_LAYER, e) ) ; 
		}		
		
		private function onAddImage(e:  CustomEvent): void
		{
			var obj : Object = e.data
			var event_ : ShowPopupEvent = new ShowPopupEvent(ShowPopupEvent.SHOW_POPUP, 
				'PopupPickImage', [this.onPickedImage], 'done' ) 		
			this.dispatch( event_ ) 
		}		
		
		private function onPickedImage( e : ImageVO ) : void
		{
			this.dispatch( new EditProductCommandTriggerEvent (
				EditProductCommandTriggerEvent.ADD_IMAGE_LAYER, e.url) ) ; 
		}
		*/
	}
}