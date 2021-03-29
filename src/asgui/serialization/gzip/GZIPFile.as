package asgui.serialization.gzip
{
   import flash.utils.ByteArray;
   
   public class GZIPFile
   {
       
      
      private var _gzipFileName:String;
      
      private var _compressedData:ByteArray;
      
      private var _headerFileName:String;
      
      private var _headerComment:String;
      
      private var _fileModificationTime:Date;
      
      private var _originalFileSize:uint;
      
      public function GZIPFile(param1:ByteArray, param2:uint, param3:Date, param4:String = "", param5:String = null, param6:String = null)
      {
         super();
         this._compressedData = param1;
         this._originalFileSize = param2;
         this._fileModificationTime = param3;
         this._gzipFileName = param4;
         this._headerFileName = param5;
         this._headerComment = param6;
      }
      
      public function get gzipFileName() : String
      {
         return this._gzipFileName;
      }
      
      public function get headerFileName() : String
      {
         return this._headerFileName;
      }
      
      public function get headerComment() : String
      {
         return this._headerComment;
      }
      
      public function get fileModificationTime() : Date
      {
         return this._fileModificationTime;
      }
      
      public function get originalFileSize() : uint
      {
         return this._originalFileSize;
      }
      
      public function getCompressedData() : ByteArray
      {
         var _loc1_:ByteArray = new ByteArray();
         this._compressedData.position = 0;
         this._compressedData.readBytes(_loc1_,0,this._compressedData.length);
         return _loc1_;
      }
   }
}
