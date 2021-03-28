package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT32;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_FightActor extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_FightActor";
      
      public static const ACTORINDEX:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FightActor.actorIndex","actorIndex",1 << 3 | WireType.VARINT);
      
      public static const TARGETINDEX:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FightActor.targetIndex","targetIndex",2 << 3 | WireType.VARINT);
      
      public static const SKILLID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FightActor.skillId","skillId",3 << 3 | WireType.VARINT);
      
      public static const BUFFID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FightActor.buffId","buffId",4 << 3 | WireType.VARINT);
      
      public static const CHANGERAGE:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("PVZ.Cmd.Dto_FightActor.changeRage","changeRage",5 << 3 | WireType.VARINT);
       
      
      private var actorIndex$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var targetIndex$field:uint;
      
      private var skillId$field:uint;
      
      private var buffId$field:uint;
      
      private var changeRage$field:int;
      
      public function Dto_FightActor()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_FightActor.$MessageID;
      }
      
      public function clearActorIndex() : void
      {
         this.hasField$0 &= 4294967294;
         this.actorIndex$field = new uint();
      }
      
      public function get hasActorIndex() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set actorIndex(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.actorIndex$field = param1;
      }
      
      public function get actorIndex() : uint
      {
         return this.actorIndex$field;
      }
      
      public function clearTargetIndex() : void
      {
         this.hasField$0 &= 4294967293;
         this.targetIndex$field = new uint();
      }
      
      public function get hasTargetIndex() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set targetIndex(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.targetIndex$field = param1;
      }
      
      public function get targetIndex() : uint
      {
         return this.targetIndex$field;
      }
      
      public function clearSkillId() : void
      {
         this.hasField$0 &= 4294967291;
         this.skillId$field = new uint();
      }
      
      public function get hasSkillId() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set skillId(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.skillId$field = param1;
      }
      
      public function get skillId() : uint
      {
         return this.skillId$field;
      }
      
      public function clearBuffId() : void
      {
         this.hasField$0 &= 4294967287;
         this.buffId$field = new uint();
      }
      
      public function get hasBuffId() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set buffId(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.buffId$field = param1;
      }
      
      public function get buffId() : uint
      {
         return this.buffId$field;
      }
      
      public function clearChangeRage() : void
      {
         this.hasField$0 &= 4294967279;
         this.changeRage$field = new int();
      }
      
      public function get hasChangeRage() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set changeRage(param1:int) : void
      {
         this.hasField$0 |= 16;
         this.changeRage$field = param1;
      }
      
      public function get changeRage() : int
      {
         return this.changeRage$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasActorIndex)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.actorIndex$field);
         }
         if(this.hasTargetIndex)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.targetIndex$field);
         }
         if(this.hasSkillId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.skillId$field);
         }
         if(this.hasBuffId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.buffId$field);
         }
         if(this.hasChangeRage)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_INT32(param1,this.changeRage$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc8_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc8_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc8_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FightActor.actorIndex cannot be set twice.");
                  }
                  _loc3_++;
                  this.actorIndex = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FightActor.targetIndex cannot be set twice.");
                  }
                  _loc4_++;
                  this.targetIndex = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FightActor.skillId cannot be set twice.");
                  }
                  _loc5_++;
                  this.skillId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FightActor.buffId cannot be set twice.");
                  }
                  _loc6_++;
                  this.buffId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FightActor.changeRage cannot be set twice.");
                  }
                  _loc7_++;
                  this.changeRage = ReadUtils.read$TYPE_INT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc8_);
                  break;
            }
         }
      }
   }
}
