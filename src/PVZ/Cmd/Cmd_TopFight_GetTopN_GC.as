package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_TopFight_GetTopN_GC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_TopFight_GetTopN_GC";
      
      public static const ROLEINFO:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_TopFight_GetTopN_GC.roleInfo","roleInfo",1 << 3 | WireType.LENGTH_DELIMITED,Dto_TopFightTopNRoleInfo);
      
      public static const BEGIN:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_TopFight_GetTopN_GC.begin","begin",2 << 3 | WireType.VARINT);
      
      public static const END:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_TopFight_GetTopN_GC.end","end",3 << 3 | WireType.VARINT);
       
      
      public var roleInfo:Array;
      
      private var begin$field:Boolean;
      
      private var hasField$0:uint = 0;
      
      private var end$field:Boolean;
      
      public function Cmd_TopFight_GetTopN_GC()
      {
         this.roleInfo = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_TopFight_GetTopN_GC.$MessageID;
      }
      
      public function clearBegin() : void
      {
         this.hasField$0 &= 4294967294;
         this.begin$field = new Boolean();
      }
      
      public function get hasBegin() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set begin(param1:Boolean) : void
      {
         this.hasField$0 |= 1;
         this.begin$field = param1;
      }
      
      public function get begin() : Boolean
      {
         return this.begin$field;
      }
      
      public function clearEnd() : void
      {
         this.hasField$0 &= 4294967293;
         this.end$field = new Boolean();
      }
      
      public function get hasEnd() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set end(param1:Boolean) : void
      {
         this.hasField$0 |= 2;
         this.end$field = param1;
      }
      
      public function get end() : Boolean
      {
         return this.end$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         var _loc2_:uint = 0;
         while(_loc2_ < this.roleInfo.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.roleInfo[_loc2_]);
            _loc2_++;
         }
         if(this.hasBegin)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_BOOL(param1,this.begin$field);
         }
         if(this.hasEnd)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_BOOL(param1,this.end$field);
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
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
                  this.roleInfo.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_TopFightTopNRoleInfo()));
                  break;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_TopFight_GetTopN_GC.begin cannot be set twice.");
                  }
                  _loc3_++;
                  this.begin = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 3:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_TopFight_GetTopN_GC.end cannot be set twice.");
                  }
                  _loc4_++;
                  this.end = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
