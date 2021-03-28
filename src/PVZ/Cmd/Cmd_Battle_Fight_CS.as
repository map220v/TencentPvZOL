package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Battle_Fight_CS extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Battle_Fight_CS";
      
      public static const TARGET:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Battle_Fight_CS.target","target",1 << 3 | WireType.LENGTH_DELIMITED,Dto_BattleTarget);
      
      public static const ISTRYAGAIN:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_Battle_Fight_CS.isTryAgain","isTryAgain",2 << 3 | WireType.VARINT);
       
      
      private var target$field:Dto_BattleTarget;
      
      private var isTryAgain$field:Boolean;
      
      private var hasField$0:uint = 0;
      
      public function Cmd_Battle_Fight_CS()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Battle_Fight_CS.$MessageID;
      }
      
      public function clearTarget() : void
      {
         this.target$field = null;
      }
      
      public function get hasTarget() : Boolean
      {
         return this.target$field != null;
      }
      
      public function set target(param1:Dto_BattleTarget) : void
      {
         this.target$field = param1;
      }
      
      public function get target() : Dto_BattleTarget
      {
         return this.target$field;
      }
      
      public function clearIsTryAgain() : void
      {
         this.hasField$0 &= 4294967294;
         this.isTryAgain$field = new Boolean();
      }
      
      public function get hasIsTryAgain() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set isTryAgain(param1:Boolean) : void
      {
         this.hasField$0 |= 1;
         this.isTryAgain$field = param1;
      }
      
      public function get isTryAgain() : Boolean
      {
         return this.isTryAgain$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasTarget)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.target$field);
         }
         if(this.hasIsTryAgain)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_BOOL(param1,this.isTryAgain$field);
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
                     throw new IOError("Bad data format: Cmd_Battle_Fight_CS.target cannot be set twice.");
                  }
                  _loc3_++;
                  this.target = new Dto_BattleTarget();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.target);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Battle_Fight_CS.isTryAgain cannot be set twice.");
                  }
                  _loc4_++;
                  this.isTryAgain = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
