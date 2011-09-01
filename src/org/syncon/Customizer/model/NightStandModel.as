package org.syncon.Customizer.model
{
	import com.roguedevelopment.objecthandles.ObjectHandles;
	
	import flash.events.Event;
	import flash.utils.Timer;
	import flash.utils.getQualifiedClassName;
	
	import flashx.undo.UndoManager;
	
	import mx.collections.ArrayCollection;
	import mx.collections.ArrayList;
	import mx.rpc.mxml.Concurrency;
	
	import org.robotlegs.mvcs.Actor;
	import org.syncon.Customizer.controller.EditProductCommandTriggerEvent;
	import org.syncon.Customizer.vo.*;
	import org.syncon.popups.controller.default_commands.ShowAlertMessageTriggerEvent;
	
	public class NightStandModel extends Actor 
	{
		public var ready : Boolean = false; 
		public function onReady() : void
		{
			this.ready = true 
			this.dispatch( new NightStandModelEvent(NightStandModelEvent.EVERNOTE_API_MODEL_READY) ) 
		}
		
		public function NightStandModel()
		{
		}		
		
		public var undo : UndoManager = new UndoManager(); 
		
		
		
		private var timerRefreshToken : Timer = new Timer(1501,1 ); 
		private var timer_Alarms : Timer = new Timer(1000*60/60,0 ); 
		
		public var loggedIn:Boolean;
		public var currentUser:Object;
		public var showAds:Object;
		/*		private var _config: RosettaStoneConfig;
		
		public function get config(): RosettaStoneConfig
		{
		return _config;
		}
		
		public function set config(value:RosettaStoneConfig):void
		{
		currentConfigSet = true; 
		_config = value;
		this.dispatch( new NightStandModelEvent( NightStandModelEvent.CONFIG_CHANGED ) ) 
		}
		*/
		
		private var _automating : Boolean = false; 
		public function get automating(): Boolean
		{
			return _automating;
		}
		
		public function set automating(value:Boolean):void
		{
			_automating = value;
			this.dispatch( new NightStandModelEvent( NightStandModelEvent.AUTOMATING_CHANGED ) ) 
		}
		
		private var _previewMode : Boolean = false; 
		public function get previewMode(): Boolean
		{
			return _previewMode;
		}
		
		public function set previewMode(value:Boolean):void
		{
			_previewMode = value;
			this.dispatch( new NightStandModelEvent( NightStandModelEvent.PRESENTATION_MODE_CHANGED, value ) ) 
		}
		
		
		
		public function layersChanged() : void
		{
			this.dispatch( new NightStandModelEvent( NightStandModelEvent.LAYERS_CHANGED ) ) 
		}
		
		private var _loadedLastLesson : Boolean = false; 
		public function get loadedLastLesson(): Boolean
		{
			return _loadedLastLesson;
		}
		
		public function set loadedLastLesson(value:Boolean):void
		{
			_loadedLastLesson = value;
			if ( value == true ) 
				this.dispatch( new NightStandModelEvent( NightStandModelEvent.LOADED_LAST_LESSON ) ) 
		}
		
		public var flex:Boolean;
		public var currentConfigSet:Boolean=false;
		private var _multipler:Number=1;
		
		public function get multipler():Number
		{
			return _multipler;
		}
		
		public function set multipler(value:Number):void
		{
			_multipler = value;
			this.dispatch( new NightStandModelEvent(NightStandModelEvent.MULTIPLER_CHANGED ) ) ; 
		}
		
		public function logout():void
		{
			this.loggedIn= false; 
			this.currentUser = null; 
		}
		
		private var _layersVisible : ArrayCollection = new ArrayCollection( ); 
		public function get layersVisible():ArrayCollection
		{
			return _layersVisible;
		}
		
		private var _layers : ArrayCollection = new ArrayCollection( ); 
		public function get layers():ArrayCollection
		{
			return _layers;
		}
		public function set layers(value:ArrayCollection):void
		{
			_layers = value;
		}
		/**
		 * used when importing items
		 * */
		public function loadLayers(value: Array):void
		{
			this.addAllTo( this.layers, value )
			this.recreateDisplayableLayers(); 
			//this.layersChanged() ; 
		}
		
		
		private var _images : ArrayCollection = new ArrayCollection( ); 
		public function get images():ArrayCollection
		{
			return _images;
		}
		public function set images(value:ArrayCollection):void
		{
			_images = value;
		}
		public function loadImages(value: Array):void
		{
			this.addAllTo( this.images, value )
			//this.dispatch( new NightStandModelEvent( NightStandModelEvent.UNITS_CHANGED, value ) ) 
		}
		
		
		
		private var _baseItem: StoreItemVO;
		public function get baseItem(): StoreItemVO 	{ return _baseItem; }
		public function set baseItem(value:StoreItemVO):void { 
			var e : Event = new NightStandModelEvent( NightStandModelEvent.BASE_ITEM_CHANGING, value )
			this.dispatch( e ) 
			if ( e.isDefaultPrevented() ) 
				return; 
			_baseItem = value;
			//this.layers = value.lists; 
			this.dispatch( new EditProductCommandTriggerEvent(
				EditProductCommandTriggerEvent.LOAD_PRODUCT, value ) ) ; 
			
			this.recreateLocations();
			
			this.dispatch( new NightStandModelEvent( NightStandModelEvent.BASE_ITEM_CHANGED, value ) ) 
		}
		
		/**
		 * Finds all layers with a location set ....should recreate when layers changed, 
		 * should not be reading from layers to import but whatever...
		 * */
		private function recreateLocations():void
		{
			var locations : Array = [] ; 
			//collect all locations, .. should probably be dynamic so after layers change we do through all ... 
			//in that case put on model this is not an edit command related location anyways ...
			for each ( var face  : FaceVO in  this.baseItem.faces ) 
			{
				/*for each ( var  layer : LayerBaseVO in face.layers ) 
				{
				if ( layer.location != '' && layer.location != null ) 
				locations.push( layer ) ; 
				}*/
				for each ( var  layer : LayerBaseVO in face.layersToImport ) 
				{
					if ( layer.location != '' && layer.location != null ) 
						locations.push( layer ) ; 
				}
			}
			
			this.locations = locations; 
		}
		
		private var _currentFace: FaceVO;
		public function get currentFace(): FaceVO 	{ return _currentFace; }
		public function set currentFace(value:FaceVO):void { 
			var e : Event = new NightStandModelEvent( NightStandModelEvent.FACE_CHANGING, value )
			this.dispatch( e ) 
			if ( e.isDefaultPrevented() ) 
				return; 
			_currentFace = value;
			this.dispatch( new NightStandModelEvent( NightStandModelEvent.FACE_CHANGED, value ) ) 
		}
		
		
		private var _currentLayer: LayerBaseVO;
		public function get currentLayer(): LayerBaseVO 	{ return _currentLayer; }
		public function set currentLayer(value:LayerBaseVO):void { 
			if ( value == this._currentLayer ) 
				return; 
			var e : Event = new NightStandModelEvent( NightStandModelEvent.CURRENT_LAYER_CHANGING, value )
			this.dispatch( e ) 
			if ( e.isDefaultPrevented() ) 
				return; 
			_currentLayer = value;
			if ( value != null && value.visible == false ) 
			{
				trace('not visible, klr' ); 
			}
			//this.dispatch( new EditProductCommandTriggerEvent(
			//	EditProductCommandTriggerEvent.LOAD_PRODUCT, value ) ) ; 
			if ( value != null ) 
			{
				this._currentLayer.layerSelected();
			}
			this.dispatch( new NightStandModelEvent( NightStandModelEvent.CURRENT_LAYER_CHANGED, value ) ) 
		}
		
		/**
		 * When popups are closed, ensure the proper layer is corrected
		 * fix applies to LayerCardPanel only 
		 * */
		public function reselectCurrentLayer()  : void
		{
			this.dispatch( new NightStandModelEvent(
				NightStandModelEvent.CURRENT_LAYER_CHANGED, this.currentLayer ) ) 
		}
		/*	
		
		public function setOdbs(e:Array, append : Boolean=false) : void
		{
		this.addAllTo( this._stories, e, append ) 
		this.dispatch( new NightStandModelEvent( NightStandModelEvent.LOADED_ODBS, e ) ) 
		}		
		
		public function loadOdb(e: OdbVO, append : Boolean=false) : void
		{
		//this.addAllTo( this._stories, e, append ) 
		this.currentOdb = e; 
		this.dispatch( new NightStandModelEvent( NightStandModelEvent.LOADED_ODB, e ) ) 
		}		
		
		
		
		public function onFailLoadList( ) : void
		{
		this.dispatch( new NightStandModelEvent( NightStandModelEvent.LOAD_ODBS_FAULT ) ) 
		}		
		*/
		
		/*
		public function getWidgetMenuItems() : Array
		{
		var labels : Array = ['Theme Settings', 'Config', 'Change Theme', 'Alarms', 'Help' ]
		var fxs : Array = [ null, this.onGlobalConfig, this.onChangeTheme, this.onAlarms, this.onHelp ]
		var arr : Array = [] 
		for ( var i : int = 0 ; i < labels.length; i++ )
		{
		arr.push( [labels[i], fxs[i]] ) 
		}
		return arr; 
		}
		*/
		protected function onGlobalConfig(event:Event):void
		{ 
			
		}
		
		private var _voiceList : ArrayCollection = new ArrayCollection( ) ; 
		private var _mute:Boolean=false;
		private var fxCallAfterSoundCompletePlaying:Function;
		/*	
		public function get fxCallAfterSoundCompletePlaying():Function
		{
		return _fxCallAfterSoundCompletePlaying;
		}
		
		public function set fxCallAfterSoundCompletePlaying(value:Function):void
		{
		_fxCallAfterSoundCompletePlaying = value;
		}
		*/
		public var port:Number;
		public var viewer: Object;
		public var objectHandles:ObjectHandles;
		public var baseLayer:LayerBaseVO;// = new LastOperationStatus(); ;
		public var layerMask:LayerBaseVO;
		/**
		 * Store the last added undo item so we can compare it later
		 * */
		public var lastUndo: EditProductCommandTriggerEvent;
		/**
		 * Will run action, not block undo 
		 * */
		public var blockUndoAdding:Boolean=false
		private var _blockUndos:Boolean;
		
		/**
		 * When undoing moving and resizing ... do not allow adding further undos 
		 * */
		public function get blockUndoExecution():Boolean
		{
			return _blockUndos;
		}
		
		/**
		 * @private
		 */
		public function set blockUndoExecution(value:Boolean):void
		{
			_blockUndos = value;
		}
		
		/**
		 * hardcoded reference to color layer 
		 * in future, use strings references based on type 
		 * */
		public var layerColor:ColorLayerVO;
		
		/**
		 * Virid thing ...
		 * */
		public var allowSelectingBgToClearSelection:Boolean=false;
		public var waitForBaseLayer: Array = [] ; ;
		public var locations:  Array;
		public var tempsku:String;//TODO:REMOVE THIS
		
		public function addLayer(layer : LayerBaseVO ) : void
		{
			this.layers.addItem( layer ) ; 
			this.recreateDisplayableLayers()
			//this.layersChanged();
		}
		public function showLayer(layer : LayerBaseVO ) : void
		{
			//should inhibit redudant requests.
			layer.visible = true; 
			layer.updateVisibility(); 
			layer.update(); 
			
		}
		
		/*		public function removeLayer(layer : LayerBaseVO ) : void
		{
		var i : int = this.layers.getItemIndex( layer ) ; 
		if ( i == -1 ) 
		return; 
		this.layers.removeItemAt( i ) ; 
		this.recreateDisplayableLayers()
		this.layersChanged();
		}
		*/
		public function removeLayer( layer : LayerBaseVO ) : void
		{
			var index : int = this.layers.getItemIndex( layer ) ;
			this.layers.removeItemAt( index ) ; 
			this.recreateDisplayableLayers()
			//this.layersChanged();
		}
		
		public function recreateDisplayableLayers(silent:Boolean=false):void
		{
			var newLayersVisible : Array = []; 
			for each ( var l : LayerBaseVO in this.layers.toArray() ) 
			{
				if ( l.showInList == false ) 
					continue; 
				newLayersVisible.push( l ) 
			}
			//y not let it do it, as user asked, this wll fail if the numbers are the same ... 
			//wrong ...
			/*
			if ( newLayersVisible.length == this.layersVisible.length ) 
				return; 
			*/
			this.addAllTo( this.layersVisible, newLayersVisible )
				
			this.layersChanged();
		}
		
		
		public function collect() : void
		{
			this.dispatch( new NightStandModelEvent(NightStandModelEvent.COLLECT
			) ) ; 
		}
		
		private function addAllTo( e:ArrayCollection, arr : Array, append : Boolean = false ) : void
		{
			if ( append == false ) 
			{
				e.source = arr; 
				e.refresh()
			}
			else
			{
				e.addAll( new ArrayList( arr ) ) ; 
				//e.refresh(); 
			}
		}
		
		public function getLayersByType(clazz : Class ) : Array
		{
			var className : String = getQualifiedClassName( clazz ) 
			var found : Array = [] ; 
			for each ( var l : LayerBaseVO in this.layers ) 
			{
				if (getQualifiedClassName(l) == className ) 
					found.push(l)
			}
			return found; 
		}
		
		/**
		 * Get next visible layer going upward ...
		 * */
		public function getNextLayer(startingIndex : int = 0, inListOnly : Boolean = true, testFunction : Function = null  ) : LayerBaseVO
		{
			var foundLayer : LayerBaseVO; 
			for ( var i : int =startingIndex ; i < this.layers.length ; i++ ) 
			{
				var layer : LayerBaseVO = this.layers.getItemAt( i ) as LayerBaseVO; 
				if ( layer.visible == false ) 
					continue; 
				if ( inListOnly && layer.showInList == false ) 
					continue; 
				
				if ( testFunction != null ) 
				{
					if ( testFunction(layer) == false ) 
						continue; 
				}
				foundLayer = layer; 
			}
			
			//start from beggining if empty ..
			if ( foundLayer == null && startingIndex != 0 )
			{
				return this.getNextLayer()
			}
			return foundLayer
		}
		
		/**
		 * return true if layer is engrave layer ..
		 * */
		public function fxIsEngraveLayer( l :  LayerBaseVO ) : Boolean
		{
			if ( l.type == TextLayerVO.Type ) 
			{
				var tl : TextLayerVO = l as TextLayerVO; 
				if ( tl.subType == ViridConstants.SUBTYPE_ENGRAVE ) 
				{
					return true
				}
			}
			return false
		}
		
		/**
		 * prefer one with no text or default text, then will show any available one
		 * */
		public function getEmptyTextLayer() : TextLayerVO
		{
			var foundLayer : TextLayerVO; 
			for ( var i : int = 0 ; i < this.layers.length ; i++ ) 
			{
				var layer_ : LayerBaseVO = this.layers.getItemAt( i ) as LayerBaseVO
				if ( layer_.type != TextLayerVO.Type ) 
					continue; 
				var layer : TextLayerVO = layer_ as TextLayerVO; 
				if ( layer.text == layer.default_text || layer.text == '' ) 
					foundLayer = layer; 
				if ( layer.visible == false ) // == layer.default_text || layer.text == '' ) 
					foundLayer = layer; 
				if ( foundLayer != null ) 
					return foundLayer; 
			}
			
			//return first text layer ...
			if ( foundLayer == null )
			{
				for ( i = 0 ; i < this.layers.length ; i++ ) 
				{
					layer_ = this.layers.getItemAt( i ) as LayerBaseVO
					if ( layer_.type != TextLayerVO.Type ) 
						continue; 
					layer = layer_ as TextLayerVO; 
					return layer; 
				}
			}
			return foundLayer
		}
		
		/**
		 * can't you use find bytype then?
		 * */
		public function getATextLayer() : TextLayerVO
		{
			var foundLayer : TextLayerVO; 
			for ( var i : int = 0 ; i < this.layers.length ; i++ ) 
			{
				var layer_ : LayerBaseVO = this.layers.getItemAt( i ) as LayerBaseVO
				if ( layer_.type != TextLayerVO.Type ) 
					continue; 
				var layer : TextLayerVO = layer_ as TextLayerVO; 
				/*if ( layer.text == layer.default_text || layer.text == '' ) 
				foundLayer = layer; 
				if ( layer.visible == false ) // == layer.default_text || layer.text == '' ) 
				foundLayer = layer; */
				if ( layer != null ) 				
					return layer; 
			}
			
			return null; 
		}
		
		/**
		 * prefer one with no text or default text, then will show any available one
		 * */
		public function getEmptyImageLayer( sourcing : String = null ) : ImageLayerVO
		{
			var foundLayer : ImageLayerVO; 
			for ( var i : int = 0 ; i < this.layers.length ; i++ ) 
			{
				var layer_ : LayerBaseVO = this.layers.getItemAt( i ) as LayerBaseVO
				if ( layer_.type != ImageLayerVO.Type ) 
					continue; 
				var layer : ImageLayerVO = layer_ as ImageLayerVO; 
				if ( sourcing != null ) 
				{
					if ( layer.image_source != sourcing  )
						continue;
				}
				if ( layer.url =='' ||  layer.url ==null   || layer.url == null || layer.url == layer.default_url ) 
					foundLayer = layer; 
				if ( layer.visible == false ) //this is probably the most important ... if not using it , clear it out for the user
					///// == layer.default_text || layer.text == '' ) 
					foundLayer = layer; 
				if ( foundLayer != null ) 
					return foundLayer; 
			}
			
			//return first text layer ...
			if ( foundLayer == null )
			{
				for ( i = 0 ; i < this.layers.length ; i++ ) 
				{
					layer_ = this.layers.getItemAt( i ) as LayerBaseVO
					if ( layer_.type != ImageLayerVO.Type ) 
						continue; 
					layer = layer_ as ImageLayerVO; 
					return layer; 
				}
			}
			return foundLayer
		}
		
		
		public function getLayerByName( name : String ) : LayerBaseVO
		{
			for ( var i : int =0 ; i < this.layers.length ; i++ ) 
			{
				var layer : LayerBaseVO = this.layers.getItemAt( i ) as LayerBaseVO; 
				if ( layer.name == name ) 
					return layer; 
			}
			return null
		}
		
		
		public function calculateProductPrice():void
		{
			var subTotal : Number = 0;
			var grandTotal : Number = 0;
			grandTotal += this.baseItem.price;
			for each ( var face : FaceVO in this.baseItem.faces.toArray() )  
			{
				subTotal = 0;
				for each ( var l : LayerBaseVO in face.layers.toArray() )  
				{
					if ( l.visible  ) 
					{
						//see if this layer is empty
						if(l.type == TextLayerVO.Type )
						{
							var textLayer:TextLayerVO = l as TextLayerVO;
							if(textLayer.text == null || textLayer.text == "")
								continue;
						}
						if(l.type == ImageLayerVO.Type )
						{
							var imgLayer:ImageLayerVO = l as ImageLayerVO;
							if(imgLayer.source == null && imgLayer.url == null)
								continue;
							if( imgLayer.source == "")
								continue;
							if( imgLayer.url == "" )
								continue;
						}
						subTotal += l.cost; 
					}
				}
				face.price = subTotal;
				grandTotal += face.price;
			}
			
			this.baseItem.grand_total = grandTotal;
			this.dispatch(new NightStandModelEvent(NightStandModelEvent.PRICE_CANGED,grandTotal));
			
		}
		
		public function isDescendent( e : Object , againsts : Object ) : Boolean 
		{
			var par : Object = e; 
			do 
			{
				par = par.parent //as UIComponent
				if ( par == againsts ) 
					return true
				
			}	while ( par.parent != null )
			
			return false 
		}
		
		public function alert( str : String, title : String = '' ) : void
		{
			this.dispatch( new ShowAlertMessageTriggerEvent(
				ShowAlertMessageTriggerEvent.SHOW_ALERT_POPUP, 
				str, title ) ) 
		}
	}
}