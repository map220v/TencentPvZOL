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
   
   public final class Dto_FightPuppetActor extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_FightPuppetActor";
      
      public static const ACTORINDEX:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FightPuppetActor.actorIndex","actorIndex",1 << 3 | WireType.VARINT);
      
      public static const TARGETINDEX:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FightPuppetActor.targetIndex","targetIndex",2 << 3 | WireType.VARINT);
      
      public static const SKILLID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FightPuppetActor.skillId","skillId",3 << 3 | WireType.VARINT);
       
      
      private var actorIndex$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var targetIndex$field:uint;
      
      private var skillId$field:uint;
      
      public function Dto_FightPuppetActor()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_FightPuppetActor.$MessageID;
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
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc6_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc6_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc6_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FightPuppetActor.actorIndex cannot be set twice.");
                  }
                  _loc3_++;
                  this.actorIndex = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FightPuppetActor.targetIndex cannot be set twice.");
                  }
                  _loc4_++;
                  this.targetIndex = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FightPuppetActor.skillId cannot be set twice.");
                  }
                  _loc5_++;
                  this.skillId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
