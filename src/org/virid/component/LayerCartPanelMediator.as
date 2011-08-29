package org.virid.component
{
	import flash.events.Event;
	
	import org.robotlegs.mvcs.Mediator;
	import org.syncon.Customizer.controller.EditProductCommandTriggerEvent;
	import org.syncon.Customizer.model.CustomEvent;
	import org.syncon.Customizer.model.NightStandModel;
	import org.syncon.Customizer.model.NightStandModelEvent;
	import org.syncon.Customizer.vo.LayerBaseVO;
	
	public class LayerCartPanelMediator extends Mediator 
	{
		[Inject] public var ui :  layer_cart_panel;
		[Inject] public var model : NightStandModel;
		
		override public function onRegister():void
		{
			eventMap.mapListener(eventDispatcher, NightStandModelEvent.LAYERS_CHANGED, 
				this.onLayersChanged );	
			onLayersChanged(null)
			eventMap.mapListener(eventDispatcher, NightStandModelEvent.CURRENT_LAYER_CHANGED, 
				this.onLayerChanged);	
			this.onLayerChanged( null ) 
			this.ui.addEventListener( layer_cart_panel.CHANGE_LIST, this.onSelectLayer ) 
			this.ui.addEventListener( layer_cart_panel.REMOVE_LAYER, this.onRemoveLayer ) 
			
		}
		
		protected function onRemoveLayer(event:CustomEvent):void
		{
			var layer :  LayerBaseVO = event.data as LayerBaseVO
			this.dispatch( new EditProductCommandTriggerEvent (
				EditProductCommandTriggerEvent.REMOVE_LAYER, layer) ) ; 
		}
		
		private function onLayersChanged(e:NightStandModelEvent):void
		{
			if ( this.ui.list.dataProvider != this.model.layersVisible ) 
				this.ui.list.dataProvider = this.model.layersVisible; 
		}
		
		/**
		 * do not try to select locked layers which will not be here
		 * */
		
		
		private function onLayerChanged(e: NightStandModelEvent): void
		{
			if ( this.model.currentLayer == null ) 
			{
				this.ui.list.selectedIndex = -1;
				return
			}
			if ( this.model.currentLayer.showInList == false ) 
				return; 
			if ( this.ui.list.selectedItem == this.model.currentLayer ) 
				return; 
			this.ui.list.selectedItem = this.model.currentLayer;
			var i : int = this.ui.list.dataProvider.getItemIndex( this.model.currentLayer ); 
			if ( i == -1 ) 
				throw 'how this happen?, why did you select this? if not in list?';
			this.ui.list.selectedIndex = i ; 
		}		
		
		public function onSelectLayer ( e : CustomEvent ) : void
		{
			var layer : LayerBaseVO = e.data as LayerBaseVO;
			//auot select so it is visible ... 
			layer.visible = true; 
			layer.update(); 
			this.model.currentLayer = layer; 
			this.ui.list.selectedItem = this.model.currentLayer
			
		}
		
	}
}