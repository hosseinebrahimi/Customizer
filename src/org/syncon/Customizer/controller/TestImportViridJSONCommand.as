package  org.syncon.Customizer.controller
{
	import org.robotlegs.mvcs.Command;
	import org.syncon.Customizer.model.NightStandModel;
	
	/**
	 * This class imports a json string into virid json importer
	 * to avoid having to use browser params 
	 * this is called automatically fromcontext, 
	 * but will not run if json is set on flashvars. 
	 * */
	public class TestImportViridJSONCommand extends Command
	{
		[Inject] public var model:NightStandModel;
		[Inject] public var event:TestImportViridJSONCommandTriggerEvent;
		
		override public function execute():void
		{
			if ( event.type == TestImportViridJSONCommandTriggerEvent.TEST_IMPORT_VIRID_JSON ) 
			{
				this.importJSON()
			}	
			
			
		}
		
		
		private function importJSON():void
		{
			var importString : String = ''
			var designProcessFull : String = '{"name":"testname", "sku":"1234", "desc":"lorem isum description of testname", "Faces":[{"name":"front", "image":"assets/products/162-000003-Z_Configure.jpg", "mask":"assets/products/162-000003-Z_ConfigureMask.png", "layer_lock":true, "Layers":[{"name":"Background Layer", "type":"color", "price":5.95, "Media":{"source":"assets/products/162-000003-Z_ConfigureMask.png", "type":"color"}, "Fonts":null, "transform":{"width":"100%", "height":"100%", "x":null, "y":null, "rotation":null}, "orientation":"horizontal", "required":true, "default":null}, {"name":"Image Layer", "type":"image", "price":10, "Media":{"source":"", "Fonts":null, "type":"image"}, "transform":{"width":"100", "height":"100", "x":"10", "y":"10", "rotation":"0"}, "orientation":"horizontal", "required":false, "default":null}, {"name":"Text Layer", "type":"text", "Media":{"source":"helloworld", "type":"text"}, "Fonts":[{"name":"arial", "size":"10", "weight":"normal"}, {"name":"bebas", "size":"15", "weight":"bold"}], "transform":{"width":"100", "height":"100", "x":"10", "y":"10", "rotation":"0"}, "orientation":"horizontal", "required":false, "default":null}, {"name":"Clipart Layer 1", "type":"clipart", "price":9.95, "Media":{"source":null, "type":"clipart"}, "Fonts":null, "transform":{"width":null, "height":null, "x":null, "y":null, "rotation":null}, "orientation":"horizontal", "required":false, "default":null}, {"name":"Clipart Layer 3", "price":9.95, "type":"clipart", "Media":{"source":null, "type":"clipart"}, "Fonts":null, "transform":{"width":null, "height":null, "x":null, "y":null, "rotation":null}, "orientation":"horizontal", "required":false, "default":null}]}]}';
			designProcessFull = '{ "name": "testname", "sku": "1234", "desc": "lorem isum description of testname", "Faces": [ { "name": "front", "image": "assets/products/162-000003-Z_Configure.jpg", "mask": "assets/products/162-000003-Z_ConfigureMask.png", "layer_lock": true, "Layers": [ { "name": "Background Layer", "type": "color", "price": 5.95, "Media": { "source": "assets/products/162-000003-Z_ConfigureMask.png", "type": "color" }, "Fonts": null, "transform": { "width": "100%", "height": "100%", "x": null, "y": null, "rotation": null }, "orientation": "horizontal", "required": true, "default": null }, { "name": "Image Layer", "type": "image", "price": 10, "Media": { "source": "", "Fonts": null, "type": "image" }, "transform": { "width": "100", "height": "100", "x": "10", "y": "10", "rotation": "0" }, "orientation": "horizontal", "required": false, "default": null }, { "name": "Text Layer", "type": "text", "Media": { "source": "helloworld", "type": "text" }, "Fonts": [ { "name": "Avalon", "size": "12", "weight": "normal" }, { "name": "Century", "size": "12", "weight": "normal" }, { "name": "Century", "size": "12", "weight": "normal" }, { "name": "OldEnglish", "size": "12", "weight": "normal" }, { "name": "RomanUL", "size": "12", "weight": "normal" }, { "name": "Script", "size": "12", "weight": "normal" } ], "transform": { "width": "100", "height": "100", "x": "10", "y": "10", "rotation": "20" }, "orientation": "horizontal", "required": false, "default": null }, { "name": "Clipart Layer 1", "type": "clipart", "price": 9.95, "Media": { "source": null, "type": "clipart" }, "Fonts": null, "transform": { "width": null, "height": null, "x": null, "y": null, "rotation": null }, "orientation": "horizontal", "required": false, "default": null }, { "name": "Clipart Layer 3", "price": 9.95, "type": "clipart", "Media": { "source": null, "type": "clipart" }, "Fonts": null, "transform": { "width": null, "height": null, "x": null, "y": null, "rotation": null }, "orientation": "horizontal", "required": false, "default": null } ] } ] }';
			designProcessFull = '{"name":"testname", "sku":"1234", "desc":"lorem isum description of testname", "Faces":[{"name":"front", "image":"assets/products/162-000003-Z_Configure.jpg", "mask":"assets/products/162-000003-Z_ConfigureMask.png", "layer_lock":true, "Layers":[{"name":"Background Layer", "type":"color", "price":5.95, "Media":{"source":"", "type":"color"}, "Fonts":null, "transform":{"width":"100%", "height":"100%", "x":null, "y":null, "rotation":null}, "orientation":"horizontal", "required":true, "default":null}, {"name":"Image Layer", "type":"image", "price":10, "Media":{"source":"", "Fonts":null, "type":"image"}, "transform":{"width":null, "height":null, "x":null, "y":null, "rotation":null}, "orientation":"horizontal", "required":false, "default":null}, {"name":"Text Layer", "type":"text", "Media":{"source":"wfrfwwefwef\\nwfwefwff", "type":"text", "font":"Century"}, "Fonts":[{"name":"Avalon", "size":"12", "weight":"normal"}, {"name":"Century", "size":"12", "weight":"normal"}, {"name":"Old English", "size":"12", "weight":"normal"}, {"name":"Helvetica", "size":"12", "weight":"normal"}, {"name":"Connecting Script", "size":"12", "weight":"normal"}, {"name":"Roman", "size":"12", "weight":"normal"}], "transform":{"width":"100", "height":"100", "x":"0", "y":"0", "rotation":"20"}, "orientation":"horizontal", "required":false, "default":true}, {"name":"Clipart Layer 1", "type":"clipart", "price":9.95, "Media":{"source":"assets/images/zippoLibrary/clipart/angel.png", "type":"clipart"}, "Fonts":null, "transform":{"x":"0", "y":"0", "height":"40.42602", "width":"40.42602", "rotation":"0"}, "orientation":"horizontal", "required":false, "default":null}, {"name":"Clipart Layer 3", "price":9.95, "type":"clipart", "Media":{"source":null, "type":"clipart"}, "Fonts":null, "transform":{"width":null, "height":null, "x":null, "y":null, "rotation":null}, "orientation":"horizontal", "required":false, "default":true}]}]}';
			//correct fonts added
			designProcessFull = '{"name":"testname","sku":"1234","desc":"lorem isum description of testname","Faces":[{"name":"front","image":"assets/products/162-000003-Z_Configure.jpg","mask":"assets/products/162-000003-Z_ConfigureMask.png","layer_lock":true,"Layers":[{"name":"Background Layer","type":"color","price":5.95,"Media":{"source":"","type":"color"},"Fonts":null,"transform":{"width":"100%","height":"100%","x":null,"y":null,"rotation":null},"orientation":"horizontal","required":true,"default":null},{"name":"Image Layer","type":"image","price":10,"Media":{"source":"","Fonts":null,"type":"image"},"transform":{"width":null,"height":null,"x":null,"y":null,"rotation":null},"orientation":"horizontal","required":false,"default":null},{"name":"Text Layer","type":"text","Media":{"source":"wfrfwwefwef\\nwfwefwff","type":"text","font":"Century"},"Fonts":[{"name":"Futura","size":"12","minSize":12,"maxSize":48,"weight":"normal"},{"name":"Brush Script","size":"12","minSize":12,"maxSize":48,"weight":"normal"},{"name":"Commercial Script","size":"12","minSize":12,"maxSize":48,"weight":"normal"},{"name":"Marker Felt","size":"12","minSize":12,"maxSize":48,"weight":"normal"},{"name":"Franklin Gothic","size":"12","minSize":12,"maxSize":48,"weight":"normal"},{"name":"Impact","size":"12","minSize":12,"maxSize":48,"weight":"normal"},{"name":"Old English","size":"12","minSize":12,"maxSize":48,"weight":"normal"},{"name":"Stencil","size":"12","minSize":12,"maxSize":48,"weight":"normal"},{"name":"Roman","size":"12","minSize":12,"maxSize":48,"weight":"normal"},{"name":"Clarendon","size":"12","minSize":12,"maxSize":48,"weight":"normal"}],"transform":{"width":"100","height":"100","x":"0","y":"0","rotation":"20"},"orientation":"horizontal","required":false,"default":true},{"name":"Clipart Layer 1","type":"clipart","price":9.95,"Media":{"source":"assets/images/zippoLibrary/clipart/angel.png","type":"clipart"},"Fonts":null,"transform":{"x":"0","y":"0","height":"40.42602","width":"40.42602","rotation":"0"},"orientation":"horizontal","required":false,"default":null},{"name":"Clipart Layer 3","price":9.95,"type":"clipart","Media":{"source":null,"type":"clipart"},"Fonts":null,"transform":{"width":null,"height":null,"x":null,"y":null,"rotation":null},"orientation":"horizontal","required":false,"default":true}]}]}';
			
			designProcessFull = '{"name":"testname","sku":"1234","desc":"lorem isum description of testname","price":10,"Fonts":[{"name":"Futura","size":"12","minSize":12,"maxSize":48,"weight":"normal"},{"name":"Brush Script","size":"12","minSize":12,"maxSize":48,"weight":"normal"},{"name":"Commercial Script","size":"12","minSize":12,"maxSize":48,"weight":"normal"},{"name":"Marker Felt","size":"12","minSize":12,"maxSize":48,"weight":"normal"},{"name":"Franklin Gothic","size":"12","minSize":12,"maxSize":48,"weight":"normal"},{"name":"Impact","size":"12","minSize":12,"maxSize":48,"weight":"normal"},{"name":"Old English","size":"12","minSize":12,"maxSize":48,"weight":"normal"},{"name":"Stencil","size":"12","minSize":12,"maxSize":48,"weight":"normal"},{"name":"Roman","size":"12","minSize":12,"maxSize":48,"weight":"normal"},{"name":"Clarendon","size":"12","minSize":12,"maxSize":48,"weight":"normal"}],"Faces":[{"name":"front","image":"assets/products/162-000003-Z_Configure.jpg","mask":"assets/products/162-000003-Z_ConfigureMask.png","layer_lock":true,"Layers":[{"name":"Background Layer","type":"color","price":5.95,"Media":{"source":"","type":"color"},"Fonts":null,"transform":{"width":"100%","height":"100%","x":null,"y":null,"rotation":null},"orientation":"horizontal","required":true,"default":null},{"name":"Image Layer","type":"image","price":10,"Media":{"source":"","Fonts":null,"type":"image"},"transform":{"width":null,"height":null,"x":null,"y":null,"rotation":null},"orientation":"horizontal","required":false,"default":null},{"name":"Text Layer","type":"text","Media":{"source":"wfrfwwefwef\\nwfwefwff","type":"text","font":"Century"},"Fonts":[{"name":"Futura","size":"12","minSize":12,"maxSize":48,"weight":"normal"},{"name":"Brush Script","size":"12","minSize":12,"maxSize":48,"weight":"normal"},{"name":"Commercial Script","size":"12","minSize":12,"maxSize":48,"weight":"normal"},{"name":"Marker Felt","size":"12","minSize":12,"maxSize":48,"weight":"normal"},{"name":"Franklin Gothic","size":"12","minSize":12,"maxSize":48,"weight":"normal"},{"name":"Impact","size":"12","minSize":12,"maxSize":48,"weight":"normal"},{"name":"Old English","size":"12","minSize":12,"maxSize":48,"weight":"normal"},{"name":"Stencil","size":"12","minSize":12,"maxSize":48,"weight":"normal"},{"name":"Roman","size":"12","minSize":12,"maxSize":48,"weight":"normal"},{"name":"Clarendon","size":"12","minSize":12,"maxSize":48,"weight":"normal"}],"transform":{"width":"100","height":"100","x":"0","y":"0","rotation":"20"},"orientation":"horizontal","required":false,"default":true},{"name":"Clipart Layer 1","type":"clipart","price":9.95,"Media":{"source":"assets/images/zippoLibrary/clipart/angel.png","type":"clipart"},"Fonts":null,"transform":{"x":"0","y":"0","height":"40.42602","width":"40.42602","rotation":"0"},"orientation":"horizontal","required":false,"default":null},{"name":"Clipart Layer 3","price":9.95,"type":"clipart","Media":{"source":null,"type":"clipart"},"Fonts":null,"transform":{"width":null,"height":null,"x":null,"y":null,"rotation":null},"orientation":"horizontal","required":false,"default":true}]}]}';
			
			var zippoDesignJSON: String = '{"name":"Classic","sku":"1023791","desc":"<br>&#8226;Black Matte<br>&#8226;Packaged in an environmentally friendly gift box<br>&#8226;Lifetime Guarantee<br>&#8226;Fill with Zippo premium lighter fluid","Faces":[{"name":"Front","image":"assets/products/218-002801-Z_Configure.jpg","mask":"assets/products/mask_classic.png", "layer_lock":true, "Layers":[{"name":"Background","type":"color","price":9.95,"Media": {"source":"99ff00", "type":"color"},                        "Fonts":null,"transform":{"width":"100%", "height":"100%", "x":null, "y":null, "rotation":null}, "orientation":"horizontal", "required":true, "default":null},{"name":"Photo", "type":"image", "price":5.00, "Media":{"source":null, "Fonts":null, "type":"image"}, "transform":{"width":null, "height":null, "x":null, "y":null, "rotation":null}, "orientation":"horizontal", "required":false, "default":null},{"name":"Text", "type":"text", "Media":{"source":"poop", "type":"text", "color":"99ff00"}, "Fonts":[{"name":"Arial","size":"24","weight":"normal"},{"name":"Helvetica","size":"24","weight":"normal"},{"name":"Script","size":"24","weight":"normal"}], "transform":{"width":null, "height":null, "x":50, "y":50, "rotation":null}, "orientation":"horizontal", "required":false, "default":null},{"name":"Image 1", "type":"clipart", "price":null, "Media":{"source":null, "type":"clipart"}, "Fonts":null, "transform":{"width":null, "height":null, "x":null, "y":null, "rotation":null}, "orientation":"horizontal", "required":false, "default":null},{"name":"Image 2", "type":"clipart", "price":null, "Media":{"source":null, "type":"clipart"}, "Fonts":null, "transform":{"width":null, "height":null, "x":null, "y":null, "rotation":null}, "orientation":"horizontal", "required":false, "default":null},{"name":"Image 3", "type":"clipart", "price":null, "Media":{"source":null, "type":"clipart"}, "Fonts":null, "transform":{"width":null, "height":null, "x":null, "y":null, "rotation":null}, "orientation":"horizontal", "required":false, "default":null},{"name":"Image 4", "type":"clipart", "price":null, "Media":{"source":null, "type":"clipart"}, "Fonts":null, "transform":{"width":null, "height":null, "x":null, "y":null, "rotation":null}, "orientation":"horizontal", "required":false, "default":null},{"name":"Image 5", "type":"clipart", "price":null, "Media":{"source":null, "type":"clipart"}, "Fonts":null, "transform":{"width":null, "height":null, "x":null, "y":null, "rotation":null}, "orientation":"horizontal", "required":false, "default":null}]}]}'; 
			var engraveVerticalAndNormal : String = '{"name":"Armor&#8482;", "sku":"1023753", "desc":"<br>&#8226;Brushed Brass<br>&#8226;1.5 times as thick as a standard sterling silver case<br>&#8226;Packaged in an environmentally friendly gift box<br>&#8226;Lifetime Guarantee<br>&#8226;Fill with Zippo premium lighter fluid", "Faces":[{"name":"front", "image":"assets/products/162-000003-Z_Configure.jpg", "mask":"null", "Layers":[{"name":"Engrave", "type":"engrave", "price":4.95, "Media":{"source":"", "type":"engrave", "max":7}, "Fonts":[{"name":"Avalon", "swfname":"Avalon", "size":"22", "weight":"normal"}, {"name":"Century", "size":"12", "weight":"normal"}, {"name":"Century", "size":"12", "weight":"normal"}, {"name":"OldEnglish", "size":"12", "weight":"normal"}, {"name":"RomanUL", "size":"12", "weight":"normal"}, {"name":"Script", "size":"12", "weight":"normal"}], "transform":{"width":"100", "height":"22", "x":"63", "y":"40", "rotation":null}, "orientation":"horizontal", "required":true, "default":null}, {"name":"Monogram", "type":"monogram", "price":4.95, "Media":{"source":"", "type":"engrave", "max":3}, "Fonts":[{"name":"Avalon", "size":"30", "weight":"normal"}, {"name":"Century", "size":"12", "weight":"normal"}, {"name":"Century", "size":"12", "weight":"normal"}, {"name":"OldEnglish", "size":"12", "weight":"normal"}, {"name":"RomanUL", "size":"12", "weight":"normal"}, {"name":"Script", "size":"12", "weight":"normal"}], "transform":{"width":"22", "height":"120", "x":"63", "y":"80", "rotation":null}, "orientation":"vertical", "required":true, "default":null}]}]}';
			engraveVerticalAndNormal= '{"name":"Armor&#8482;", "sku":"1023753", "desc":"<br>&#8226;Brushed Brass<br>&#8226;1.5 times as thick as a standard sterling silver case<br>&#8226;Packaged in an environmentally friendly gift box<br>&#8226;Lifetime Guarantee<br>&#8226;Fill with Zippo premium lighter fluid", "Faces":[{"name":"front", "image":"assets/products/162-000003-Z_Configure.jpg", "mask":"null", "Layers":[{"name":"Engrave", "type":"engrave", "price":4.95, "Media":{"source":"", "type":"engrave", "max":7}, "Fonts":[{"name":"Avalon", "swfname":"Avalon", "size":"22", "weight":"normal"}, {"name":"Century", "size":"12", "weight":"normal"}, {"name":"OldEnglish", "swfname":"Engravers", "size":"12", "weight":"normal"}, {"name":"Times", "size":"12", "weight":"normal"}, {"name":"Script", "size":"18", "weight":"normal"}], "transform":{"width":"100", "height":"22", "x":"63", "y":"40", "rotation":null}, "orientation":"horizontal", "required":true, "default":null}, {"name":"Monogram", "type":"monogram", "price":4.95, "Media":{"source":"", "type":"engrave", "max":3}, "Fonts":[{"name":"Avalon", "swfname":"Avalon", "size":"22", "weight":"normal"}, {"name":"Century", "size":"12", "weight":"normal"}, {"name":"OldEnglish", "swfname":"Engravers", "size":"12", "weight":"normal"}, {"name":"Times", "size":"12", "weight":"normal"}, {"name":"Script", "size":"18", "weight":"normal"}], "transform":{"width":"22", "height":"120", "x":"63", "y":"80", "rotation":null}, "orientation":"vertical", "required":true, "default":null}]}]}';
			var engrave4Faces : String = '{"name":"1941 Replica &#8482;", "sku":"1023763", "desc":"<br>&#8226;Brushed Brass<br>&#8226;Case has flat planes with sharper, less rounded edges where the front and back surfaces meet the sides<br>&#8226;Lid and the bottom are joined with a four-barrel hinge<br>&#8226;Inside unit are flatter, with squared edges where they meet the front and back sur", "Faces":[{"name":"Front", "image":"assets/products/1941B-000003-Z_Configure.jpg", "mask":"", "Layers":[{"name":"Top Front", "type":"monogram", "price":4.95, "Media":{"source":"", "type":"engrave", "max":16}, "Fonts":[{"name":"Avalon", "size":"12", "weight":"normal"}, {"name":"Century", "size":"12", "weight":"normal"}, {"name":"Century", "size":"12", "weight":"normal"}, {"name":"OldEnglish", "size":"12", "weight":"normal"}, {"name":"RomanUL", "size":"12", "weight":"normal"}, {"name":"Script", "size":"12", "weight":"normal"}], "transform":{"width":"130", "height":"40", "x":"45", "y":"75", "rotation":null}, "orientation":"horizontal", "required":true, "default":null}, {"name":"Bottom Front", "type":"monogram", "price":4.95, "Media":{"source":"", "type":"engrave", "max":16}, "Fonts":[{"name":"Avalon", "size":"12", "weight":"normal"}, {"name":"Century", "size":"12", "weight":"normal"}, {"name":"Century", "size":"12", "weight":"normal"}, {"name":"OldEnglish", "size":"12", "weight":"normal"}, {"name":"RomanUL", "size":"12", "weight":"normal"}, {"name":"Script", "size":"12", "weight":"normal"}], "transform":{"width":"130", "height":"40", "x":"45", "y":"180", "rotation":null}, "orientation":"horizontal", "required":true, "default":null}]}, {"name":"Back", "image":"assets/products/1941B-000003-Z_Configure.jpg", "mask":"", "Layers":[{"name":"Top Back", "type":"monogram", "price":4.95, "Media":{"source":"", "type":"engrave", "max":16}, "Fonts":[{"name":"Avalon", "size":"12", "weight":"normal"}, {"name":"Century", "size":"12", "weight":"normal"}, {"name":"Century", "size":"12", "weight":"normal"}, {"name":"OldEnglish", "size":"12", "weight":"normal"}, {"name":"RomanUL", "size":"12", "weight":"normal"}, {"name":"Script", "size":"12", "weight":"normal"}], "transform":{"width":"130", "height":"40", "x":"45", "y":"75", "rotation":null}, "orientation":"horizontal", "required":true, "default":null}, {"name":"Bottom Back", "type":"monogram", "price":4.95, "Media":{"source":"", "type":"engrave", "max":16}, "Fonts":[{"name":"Avalon", "size":"12", "weight":"normal"}, {"name":"Century", "size":"12", "weight":"normal"}, {"name":"Century", "size":"12", "weight":"normal"}, {"name":"OldEnglish", "size":"12", "weight":"normal"}, {"name":"RomanUL", "size":"12", "weight":"normal"}, {"name":"Script", "size":"12", "weight":"normal"}], "transform":{"width":"130", "height":"40", "x":"45", "y":"180", "rotation":null}, "orientation":"horizontal", "required":true, "default":null}]}]}';
			importString = engraveVerticalAndNormal;
			engrave4Faces  = '{"name":"1941 Replica", "sku":"1023763", "desc":"<br>&#8226;Brushed Brass<br>&#8226;Case has flat planes with sharper, less rounded edges where the front and back surfaces meet the sides<br>&#8226;Lid and the bottom are joined with a four-barrel hinge<br>&#8226;Inside unit are flatter, with squared edges where they meet the front and back sur", "Faces":[{"name":"Front", "image":"assets/products/1941B-000003-Z_Configure.jpg", "mask":"", "Layers":[{"name":"Top Front", "type":"monogram", "price":4.95, "Media":{"source":"", "type":"engrave", "max":16}, "Fonts":[{"name":"Avalon", "size":"12", "weight":"normal"}, {"name":"Century", "size":"12", "weight":"normal"}, {"name":"Century", "size":"12", "weight":"normal"}, {"name":"OldEnglish", "size":"12", "weight":"normal"}, {"name":"RomanUL", "size":"12", "weight":"normal"}, {"name":"Script", "size":"12", "weight":"normal"}], "transform":{"width":"130", "height":"40", "x":"45", "y":"75", "rotation":null}, "orientation":"horizontal", "required":true, "default":null}, {"name":"Bottom Front", "type":"monogram", "price":4.95, "Media":{"source":"", "type":"engrave", "max":16}, "Fonts":[{"name":"Avalon", "size":"12", "weight":"normal"}, {"name":"Century", "size":"12", "weight":"normal"}, {"name":"Century", "size":"12", "weight":"normal"}, {"name":"OldEnglish", "size":"12", "weight":"normal"}, {"name":"RomanUL", "size":"12", "weight":"normal"}, {"name":"Script", "size":"12", "weight":"normal"}], "transform":{"width":"130", "height":"40", "x":"45", "y":"180", "rotation":null}, "orientation":"horizontal", "required":true, "default":null}]}, {"name":"Back", "image":"assets/products/1941B-000003-Z_Configure.jpg", "mask":"", "Layers":[{"name":"Top Back", "type":"monogram", "price":4.95, "Media":{"source":"", "type":"engrave", "max":16}, "Fonts":[{"name":"Avalon", "size":"12", "weight":"normal"}, {"name":"Century", "size":"12", "weight":"normal"}, {"name":"Century", "size":"12", "weight":"normal"}, {"name":"OldEnglish", "size":"12", "weight":"normal"}, {"name":"RomanUL", "size":"12", "weight":"normal"}, {"name":"Script", "size":"12", "weight":"normal"}], "transform":{"width":"130", "height":"40", "x":"45", "y":"75", "rotation":null}, "orientation":"horizontal", "required":true, "default":null}, {"name":"Bottom Back", "type":"monogram", "price":4.95, "Media":{"source":"", "type":"engrave", "max":16}, "Fonts":[{"name":"Avalon", "size":"12", "weight":"normal"}, {"name":"Century", "size":"12", "weight":"normal"}, {"name":"Century", "size":"12", "weight":"normal"}, {"name":"OldEnglish", "size":"12", "weight":"normal"}, {"name":"RomanUL", "size":"12", "weight":"normal"}, {"name":"Script", "size":"12", "weight":"normal"}], "transform":{"width":"130", "height":"40", "x":"45", "y":"180", "rotation":null}, "orientation":"horizontal", "required":true, "default":null}]}]}';
			'{"name":"1941 Replica", "sku":"1023763", "desc":"<br>&#8226;Brushed Brass<br>&#8226;Case has flat planes with sharper, less rounded edges where the front and back surfaces meet the sides<br>&#8226;Lid and the bottom are joined with a four-barrel hinge<br>&#8226;Inside unit are flatter, with squared edges where they meet the front and back sur", "price":"20.00", "Faces":[{"name":"Front", "image":"assets/products/1941B-000003-Z_Configure.jpg", "mask":"", "Layers":[{"name":"Top Front", "type":"engrave", "price":4.95, "Media":{"source":"", "type":"engrave", "max":16}, "Fonts":[{"name":"Avalon", "size":"12", "weight":"normal"}, {"name":"Century", "size":"12", "weight":"normal"}, {"name":"Century", "size":"12", "weight":"normal"}, {"name":"OldEnglish", "size":"12", "weight":"normal"}, {"name":"RomanUL", "size":"12", "weight":"normal"}, {"name":"Script", "size":"12", "weight":"normal"}], "transform":{"width":"130", "height":"40", "x":"45", "y":"75", "rotation":null}, "orientation":"horizontal", "required":false, "default":null}, {"name":"Bottom Front", "type":"engrave", "price":6.95, "Media":{"source":"", "type":"engrave", "max":16}, "Fonts":[{"name":"Avalon", "size":"12", "weight":"normal"}, {"name":"Century", "size":"12", "weight":"normal"}, {"name":"Century", "size":"12", "weight":"normal"}, {"name":"OldEnglish", "size":"12", "weight":"normal"}, {"name":"RomanUL", "size":"12", "weight":"normal"}, {"name":"Script", "size":"12", "weight":"normal"}], "transform":{"width":"130", "height":"40", "x":"45", "y":"75", "rotation":null}, "orientation":"horizontal", "required":true, "default":null}]}]}';
			//engrave4Faces   = '{"name":"1941 Replica", "sku":"1023763", "desc":"<br>&#8226;Brushed Brass<br>&#8226;Case has flat planes with sharper, less rounded edges where the front and back surfaces meet the sides<br>&#8226;Lid and the bottom are joined with a four-barrel hinge<br>&#8226;Inside unit are flatter, with squared edges where they meet the front and back sur", "Faces":[{"name":"Front", "image":"assets/products/1941B-000003-Z_Configure.jpg", "mask":"", "Layers":[{"name":"Top Front", "type":"hidden", "price":4.95, "Media":{"source":"", "type":"engrave", "max":16}, "Fonts":[{"name":"Avalon", "size":"12", "minSize":12, "maxSize":48, "weight":"normal"}, {"name":"Century", "size":"12", "weight":"normal"}, {"name":"Century", "size":"12", "weight":"normal"}, {"name":"OldEnglish", "size":"12", "weight":"normal"}, {"name":"RomanUL", "size":"12", "weight":"normal"}, {"name":"Script", "size":"12", "weight":"normal"}], "transform":{"width":"130", "height":"40", "x":"45", "y":"75", "rotation":null}, "orientation":"horizontal", "required":true, "default":null}, {"name":"Bottom Front", "type":"hidden", "price":4.95, "Media":{"source":"", "type":"engrave", "max":16}, "Fonts":[{"name":"Avalon", "size":"12", "weight":"normal"}, {"name":"Century", "size":"12", "weight":"normal"}, {"name":"Century", "size":"12", "weight":"normal"}, {"name":"OldEnglish", "size":"12", "weight":"normal"}, {"name":"RomanUL", "size":"12", "weight":"normal"}, {"name":"Script", "size":"12", "weight":"normal"}], "transform":{"width":"130", "height":"40", "x":"45", "y":"180", "rotation":null}, "orientation":"horizontal", "required":true, "default":null}]}, {"name":"Back", "image":"assets/products/1941B-000003-Z_Configure.jpg", "mask":"", "Layers":[{"name":"Top Back", "type":"hidden", "price":4.95, "Media":{"source":"", "type":"engrave", "max":16}, "Fonts":[{"name":"Avalon", "size":"12", "weight":"normal"}, {"name":"Century", "size":"12", "weight":"normal"}, {"name":"Century", "size":"12", "weight":"normal"}, {"name":"OldEnglish", "size":"12", "weight":"normal"}, {"name":"RomanUL", "size":"12", "weight":"normal"}, {"name":"Script", "size":"12", "weight":"normal"}], "transform":{"width":"130", "height":"40", "x":"45", "y":"75", "rotation":null}, "orientation":"horizontal", "required":true, "default":null}, {"name":"Bottom Back", "type":"monogram", "price":4.95, "Media":{"source":"", "type":"engrave", "max":16}, "Fonts":[{"name":"Avalon", "size":"12", "weight":"normal"}, {"name":"Century", "size":"12", "weight":"normal"}, {"name":"Century", "size":"12", "weight":"normal"}, {"name":"OldEnglish", "size":"12", "weight":"normal"}, {"name":"RomanUL", "size":"12", "weight":"normal"}, {"name":"Script", "size":"12", "weight":"normal"}], "transform":{"width":"130", "height":"40", "x":"45", "y":"180", "rotation":null}, "orientation":"horizontal", "required":true, "default":null}]}]}';
			//importString = zippoDesignJSON;
			importString = engrave4Faces;
			importString = designProcessFull;
			
			if ( importString == '' || importString == null ) 
				return;
			this.dispatch( new ImportViridJSONCommandTriggerEvent(
				ImportViridJSONCommandTriggerEvent.IMPORT_JSON,importString)) ;
			
		}
		
		
	}
}