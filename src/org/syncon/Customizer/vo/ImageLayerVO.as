package  org.syncon.Customizer.vo
{
	public class ImageLayerVO  extends  LayerBaseVO
	{
		public var hiSpeedMode : Boolean = true; 
		
		public static var Type:String= 'IMAGE';
		
		/**
		 * Specifies limits on change this image ...internally does nothing
		 * */
		public var image_source : String = ''; 
		/**
		 * wtf?
		 * */
		public var mask:Boolean;
		/**
		 * Needed so we know size of base layer at all times ... or you could just look it up 
		 * */
		public var base_layer:Boolean;
		/**
		 * dispatched when layer is resized ...
		 * ignored by itemrenderer to prevent updating loops
		 * */
		public static var RESIZE_COMPLETE:String= 'resizecom';
		/**
		 * ignore the adove resize_complete, dispatches when souce explicity changed
		 * */
		public static var SOURCE_CHANGED:String= 'SOURCE_CHANGED';
		public override function get type():String 	{ return Type; }
		
/*		override public function clone() : LayerBaseVO
		{
			var img : ImageLayerVO = super.clone() as ImageLayerVO
			img.image_source = this.image_source
			img.mask = this.mask; 
			return img; 
		}*/
		
		override  public function clone() : LayerBaseVO
		{
			var img : ImageLayerVO = new ImageLayerVO()
			this.copyPropsTo(img)  
			img.image_source = this.image_source
			img.mask = this.mask; 
			return img; 
		}
		
	}
}