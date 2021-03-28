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
   
   public final class Dto_PlayZoneTask extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_PlayZoneTask";
      
      public static const KEY:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_PlayZoneTask.key","key",1 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const VALUE:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_PlayZoneTask.value","value",2 << 3 | WireType.LENGTH_DELIMITED);
       
      
      private var key$field:String;
      
      private var value$field:String;
      
      public function Dto_PlayZoneTask()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_PlayZoneTask.$MessageID;
      }
      
      public function clearKey() : void
      {
         this.key$field = null;
      }
      
      public function get hasKey() : Boolean
      {
         return this.key$field != null;
      }
      
      public function set key(param1:String) : void
      {
         this.key$field = param1;
      }
      
      public function get key() : String
      {
         return this.key$field;
      }
      
      public function clearValue() : void
      {
         this.value$field = null;
      }
      
      public function get hasValue() : Boolean
      {
         return this.value$field != null;
      }
      
      public function set value(param1:String) : void
      {
         this.value$field = param1;
      }
      
      public function get value() : String
      {
         return this.value$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasKey)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_STRING(param1,this.key$field);
         }
         if(this.hasValue)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_STRING(param1,this.value$field);
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
                     throw new IOError("Bad data format: Dto_PlayZoneTask.key cannot be set twice.");
                  }
                  _loc3_++;
                  this.key = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_PlayZoneTask.value cannot be set twice.");
                  }
                  _loc4_++;
                  this.value = ReadUtils.read$TYPE_STRING(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
