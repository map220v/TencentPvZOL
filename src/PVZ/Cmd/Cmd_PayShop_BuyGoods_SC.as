package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_PayShop_BuyGoods_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_PayShop_BuyGoods_SC";
      
      public static const TOKEN:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Cmd_PayShop_BuyGoods_SC.token","token",1 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const URL:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Cmd_PayShop_BuyGoods_SC.url","url",2 << 3 | WireType.LENGTH_DELIMITED);
       
      
      private var token$field:String;
      
      private var url$field:String;
      
      public function Cmd_PayShop_BuyGoods_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_PayShop_BuyGoods_SC.$MessageID;
      }
      
      public function clearToken() : void
      {
         this.token$field = null;
      }
      
      public function get hasToken() : Boolean
      {
         return this.token$field != null;
      }
      
      public function set token(param1:String) : void
      {
         this.token$field = param1;
      }
      
      public function get token() : String
      {
         return this.token$field;
      }
      
      public function clearUrl() : void
      {
         this.url$field = null;
      }
      
      public function get hasUrl() : Boolean
      {
         return this.url$field != null;
      }
      
      public function set url(param1:String) : void
      {
         this.url$field = param1;
      }
      
      public function get url() : String
      {
         return this.url$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasToken)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_STRING(param1,this.token$field);
         }
         if(this.hasUrl)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_STRING(param1,this.url$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc5_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc5_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_PayShop_BuyGoods_SC.token cannot be set twice.");
                  }
                  _loc3_++;
                  this.token = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_PayShop_BuyGoods_SC.url cannot be set twice.");
                  }
                  _loc4_++;
                  this.url = ReadUtils.read$TYPE_STRING(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
