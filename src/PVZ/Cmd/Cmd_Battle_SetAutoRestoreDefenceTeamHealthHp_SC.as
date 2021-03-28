package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Battle_SetAutoRestoreDefenceTeamHealthHp_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Battle_SetAutoRestoreDefenceTeamHealthHp_SC";
      
      public static const OPEN:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_Battle_SetAutoRestoreDefenceTeamHealthHp_SC.open","open",1 << 3 | WireType.VARINT);
      
      public static const HEALTHLIMIT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Battle_SetAutoRestoreDefenceTeamHealthHp_SC.healthLimit","healthLimit",2 << 3 | WireType.VARINT);
       
      
      private var open$field:Boolean;
      
      private var hasField$0:uint = 0;
      
      private var healthLimit$field:uint;
      
      public function Cmd_Battle_SetAutoRestoreDefenceTeamHealthHp_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Battle_SetAutoRestoreDefenceTeamHealthHp_SC.$MessageID;
      }
      
      public function clearOpen() : void
      {
         this.hasField$0 &= 4294967294;
         this.open$field = new Boolean();
      }
      
      public function get hasOpen() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set open(param1:Boolean) : void
      {
         this.hasField$0 |= 1;
         this.open$field = param1;
      }
      
      public function get open() : Boolean
      {
         return this.open$field;
      }
      
      public function clearHealthLimit() : void
      {
         this.hasField$0 &= 4294967293;
         this.healthLimit$field = new uint();
      }
      
      public function get hasHealthLimit() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set healthLimit(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.healthLimit$field = param1;
      }
      
      public function get healthLimit() : uint
      {
         return this.healthLimit$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasOpen)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_BOOL(param1,this.open$field);
         }
         if(this.hasHealthLimit)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.healthLimit$field);
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
                     throw new IOError("Bad data format: Cmd_Battle_SetAutoRestoreDefenceTeamHealthHp_SC.open cannot be set twice.");
                  }
                  _loc3_++;
                  this.open = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Battle_SetAutoRestoreDefenceTeamHealthHp_SC.healthLimit cannot be set twice.");
                  }
                  _loc4_++;
                  this.healthLimit = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
