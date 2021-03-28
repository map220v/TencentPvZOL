package
{
   import flash.utils.ByteArray;
   import mx.core.MovieClipLoaderAsset;
   
   public class Main_pvz_skin_swf extends MovieClipLoaderAsset
   {
      
      private static var bytes:ByteArray = null;
       
      
      public var dataClass:Class;
      
      public function Main_pvz_skin_swf()
      {
         this.dataClass = Main_pvz_skin_swf_dataClass;
         super();
         initialWidth = 11000 / 20;
         initialHeight = 8000 / 20;
      }
      
      override public function get movieClipData() : ByteArray
      {
         if(bytes == null)
         {
            bytes = ByteArray(new this.dataClass());
         }
         return bytes;
      }
   }
}
