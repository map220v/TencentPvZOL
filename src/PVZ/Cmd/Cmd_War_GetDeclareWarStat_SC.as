package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_War_GetDeclareWarStat_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_War_GetDeclareWarStat_SC";
      
      public static const TOTALDECLARETIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_War_GetDeclareWarStat_SC.totalDeclareTimes","totalDeclareTimes",1 << 3 | WireType.VARINT);
      
      public static const LEFTDECLARETIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_War_GetDeclareWarStat_SC.leftDeclareTimes","leftDeclareTimes",2 << 3 | WireType.VARINT);
       
      
      private var totalDeclareTimes$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var leftDeclareTimes$field:uint;
      
      public function Cmd_War_GetDeclareWarStat_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_War_GetDeclareWarStat_SC.$MessageID;
      }
      
      public function clearTotalDeclareTimes() : void
      {
         this.hasField$0 &= 4294967294;
         this.totalDeclareTimes$field = new uint();
      }
      
      public function get hasTotalDeclareTimes() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set totalDeclareTimes(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.totalDeclareTimes$field = param1;
      }
      
      public function get totalDeclareTimes() : uint
      {
         return this.totalDeclareTimes$field;
      }
      
      public function clearLeftDeclareTimes() : void
      {
         this.hasField$0 &= 4294967293;
         this.leftDeclareTimes$field = new uint();
      }
      
      public function get hasLeftDeclareTimes() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set leftDeclareTimes(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.leftDeclareTimes$field = param1;
      }
      
      public function get leftDeclareTimes() : uint
      {
         return this.leftDeclareTimes$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasTotalDeclareTimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.totalDeclareTimes$field);
         }
         if(this.hasLeftDeclareTimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.leftDeclareTimes$field);
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
                     throw new IOError("Bad data format: Cmd_War_GetDeclareWarStat_SC.totalDeclareTimes cannot be set twice.");
                  }
                  _loc3_++;
                  this.totalDeclareTimes = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_War_GetDeclareWarStat_SC.leftDeclareTimes cannot be set twice.");
                  }
                  _loc4_++;
                  this.leftDeclareTimes = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
