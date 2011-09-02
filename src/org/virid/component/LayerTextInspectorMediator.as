package org.virid.component
{
	import flash.events.Event;
	
	import org.robotlegs.mvcs.Mediator;
	import org.syncon.Customizer.controller.EditProductCommandTriggerEvent;
	import org.syncon.Customizer.model.CustomEvent;
	import org.syncon.Customizer.model.NightStandModel;
	import org.syncon.Customizer.view.ui.LayerInspector;
	import org.syncon.Customizer.vo.LayerBaseVO;
	import org.syncon.Customizer.vo.TextLayerVO;
	import org.syncon.onenote.onenotehelpers.impl.layer_item_renderer;
	
	public class LayerTextInspectorMediator extends Mediator 
	{
		[Inject] public var ui : LayerTextInspector;
		[Inject] public var model : NightStandModel;
		
		override public function onRegister():void
		{
			/*
			this.ui.addEventListener( design_panel.CHANGE_FONT_SIZE, 
				this.onChangeFontSize);	*/
			this.ui.addEventListener( LayerTextInspector.CHANGE_COLOR, 
				this.onChangeColor);				
			this.ui.addEventListener( LayerTextInspector.CHANGE_FONT_FAMILY, 
				this.onChangeFontFamily);	
			this.ui.addEventListener( LayerTextInspector.CHANGE_TEXT_ALIGN, 
				this.onChangeTextAlign);	
			this.ui.addEventListener( LayerTextInspector.CHANGED_TEXT, 
				this.onChangeText );	
			this.ui.addEventListener( LayerTextInspector.DATA_CHANGED, 
				this.onDataChanged );	
			onDataChanged(null)
		}
		
		protected function onDataChanged(event:Event):void
		{
			this.ui.txt.prompt = this.layer.default_text; 
			this.onChangeText(null); 
		}
		
		public function get layer () : TextLayerVO 
		{
			return this.ui.layer; 
		}
		protected function onChangeText(event:Event):void
		{
		/*	if ( this.layer.text == '' && this.layer.default_text!= ''  ) 
			{*/
				
	/*		}*/
			this.layer.text = this.ui.txt.text; 
			
			//noiw hwo to automate it? ... not worry about undos, i do it here 
			this.layer.setFontSize(); 
			this.model.calculateProductPrice();
			this.layer.adjustDisplayText()
				
			this.layer.update(); 
		}
		
		/**
		 * if check box selected, go to the left
		 * */
		protected function onChangeTextAlign(event:CustomEvent):void
		{
			if ( event.data ==  false ) 
			{
			this.dispatch( new EditProductCommandTriggerEvent ( 
				EditProductCommandTriggerEvent.CHANGE_TEXT_ALIGN, 'left' 
			) )  
			}
			else
			{
			this.dispatch( new EditProductCommandTriggerEvent ( 
				EditProductCommandTriggerEvent.CHANGE_TEXT_ALIGN, 'right' 
			) )  
			}
		}
		
		protected function onChangeFontSize(event:CustomEvent):void
		{
			this.dispatch( new EditProductCommandTriggerEvent ( 
				EditProductCommandTriggerEvent.CHANGE_FONT_SIZE, event.data 
			) )  
			/*		this.ui.layer.fontSize = int(  event.data ); 
			this.ui.layer.update('fontSize'); */
		}
		
		protected function onChangeColor(event:CustomEvent):void
		{
			this.dispatch( new EditProductCommandTriggerEvent ( 
				EditProductCommandTriggerEvent.CHANGE_COLOR, event.data 
			) )  
		}
		
		protected function onChangeFontFamily(event:CustomEvent):void
		{
			this.dispatch( new EditProductCommandTriggerEvent ( 
				EditProductCommandTriggerEvent.CHANGE_FONT_FAMILY, event.data 
			) )  
		}
		
		
		
		
		
	}
}