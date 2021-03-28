package asgui.styles
{
   import asgui.serialization.css.CssDeserializer;
   
   class StyleSkinInfo
   {
       
      
      var skinDatas:Array;
      
      var infos:Array;
      
      function StyleSkinInfo(param1:String)
      {
         var _loc3_:int = 0;
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc6_:String = null;
         var _loc7_:Array = null;
         var _loc8_:Object = null;
         var _loc9_:SkinDataInfo = null;
         super();
         this.skinDatas = [];
         this.infos = [];
         var _loc2_:Array = CssDeserializer.SeparateIntoTags(param1,"(",")");
         _loc3_ = 0;
         while(_loc3_ < _loc2_.length)
         {
            if(_loc2_[_loc3_].toString().length != 0)
            {
               _loc8_ = CssDeserializer.AnalyseToObject(_loc2_[_loc3_ + 1].toString());
               _loc9_ = new SkinDataInfo(_loc2_[_loc3_],_loc8_);
               this.infos.push(_loc9_);
               this.skinDatas.push(StyleManager.impl.GetStyleData(_loc9_));
            }
            _loc3_ += 2;
         }
      }
   }
}
