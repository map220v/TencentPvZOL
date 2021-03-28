package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_GuildFight_GetClashRecord_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_GuildFight_GetClashRecord_SC";
      
      public static const CLASHID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_GuildFight_GetClashRecord_SC.clashId","clashId",1 << 3 | WireType.VARINT);
      
      public static const CLASHTYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_GuildFight_GetClashRecord_SC.clashType","clashType",2 << 3 | WireType.VARINT);
      
      public static const CLASHRECORD:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_GuildFight_GetClashRecord_SC.clashRecord","clashRecord",3 << 3 | WireType.LENGTH_DELIMITED,Dto_GuildFight_ClashRecord);
       
      
      private var clashId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var clashType$field:uint;
      
      public var clashRecord:Array;
      
      public function Cmd_GuildFight_GetClashRecord_SC()
      {
         this.clashRecord = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_GuildFight_GetClashRecord_SC.$MessageID;
      }
      
      public function clearClashId() : void
      {
         this.hasField$0 &= 4294967294;
         this.clashId$field = new uint();
      }
      
      public function get hasClashId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set clashId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.clashId$field = param1;
      }
      
      public function get clashId() : uint
      {
         return this.clashId$field;
      }
      
      public function clearClashType() : void
      {
         this.hasField$0 &= 4294967293;
         this.clashType$field = new uint();
      }
      
      public function get hasClashType() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set clashType(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.clashType$field = param1;
      }
      
      public function get clashType() : uint
      {
         return this.clashType$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasClashId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.clashId$field);
         }
         if(this.hasClashType)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.clashType$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.clashRecord.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.clashRecord[_loc2_]);
            _loc2_++;
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
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_GuildFight_GetClashRecord_SC.clashId cannot be set twice.");
                  }
                  _loc3_++;
                  this.clashId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_GuildFight_GetClashRecord_SC.clashType cannot be set twice.");
                  }
                  _loc4_++;
                  this.clashType = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  this.clashRecord.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_GuildFight_ClashRecord()));
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
