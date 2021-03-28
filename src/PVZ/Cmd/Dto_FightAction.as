package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_ENUM;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_FightAction extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_FightAction";
      
      public static const ACTOR:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_FightAction.actor","actor",1 << 3 | WireType.LENGTH_DELIMITED,Dto_FightActor);
      
      public static const DAMAGE:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_FightAction.damage","damage",2 << 3 | WireType.LENGTH_DELIMITED,Dto_FightDamage);
      
      public static const COUNTERACTOR:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_FightAction.counterActor","counterActor",3 << 3 | WireType.LENGTH_DELIMITED,Dto_FightActor);
      
      public static const COUNTERDAMAGE:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_FightAction.counterDamage","counterDamage",4 << 3 | WireType.LENGTH_DELIMITED,Dto_FightDamage);
      
      public static const ACTIONTYPE:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("PVZ.Cmd.Dto_FightAction.actionType","actionType",5 << 3 | WireType.VARINT,E_FightActionType);
      
      public static const PUPPETACTOR:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_FightAction.puppetActor","puppetActor",6 << 3 | WireType.LENGTH_DELIMITED,Dto_FightPuppetActor);
       
      
      private var actor$field:Dto_FightActor;
      
      public var damage:Array;
      
      private var counterActor$field:Dto_FightActor;
      
      public var counterDamage:Array;
      
      private var actionType$field:int;
      
      private var hasField$0:uint = 0;
      
      private var puppetActor$field:Dto_FightPuppetActor;
      
      public function Dto_FightAction()
      {
         this.damage = [];
         this.counterDamage = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_FightAction.$MessageID;
      }
      
      public function clearActor() : void
      {
         this.actor$field = null;
      }
      
      public function get hasActor() : Boolean
      {
         return this.actor$field != null;
      }
      
      public function set actor(param1:Dto_FightActor) : void
      {
         this.actor$field = param1;
      }
      
      public function get actor() : Dto_FightActor
      {
         return this.actor$field;
      }
      
      public function clearCounterActor() : void
      {
         this.counterActor$field = null;
      }
      
      public function get hasCounterActor() : Boolean
      {
         return this.counterActor$field != null;
      }
      
      public function set counterActor(param1:Dto_FightActor) : void
      {
         this.counterActor$field = param1;
      }
      
      public function get counterActor() : Dto_FightActor
      {
         return this.counterActor$field;
      }
      
      public function clearActionType() : void
      {
         this.hasField$0 &= 4294967294;
         this.actionType$field = new int();
      }
      
      public function get hasActionType() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set actionType(param1:int) : void
      {
         this.hasField$0 |= 1;
         this.actionType$field = param1;
      }
      
      public function get actionType() : int
      {
         return this.actionType$field;
      }
      
      public function clearPuppetActor() : void
      {
         this.puppetActor$field = null;
      }
      
      public function get hasPuppetActor() : Boolean
      {
         return this.puppetActor$field != null;
      }
      
      public function set puppetActor(param1:Dto_FightPuppetActor) : void
      {
         this.puppetActor$field = param1;
      }
      
      public function get puppetActor() : Dto_FightPuppetActor
      {
         return this.puppetActor$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc4_:* = undefined;
         if(this.hasActor)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.actor$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.damage.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.damage[_loc2_]);
            _loc2_++;
         }
         if(this.hasCounterActor)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.counterActor$field);
         }
         var _loc3_:uint = 0;
         while(_loc3_ < this.counterDamage.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_MESSAGE(param1,this.counterDamage[_loc3_]);
            _loc3_++;
         }
         if(this.hasActionType)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_ENUM(param1,this.actionType$field);
         }
         if(this.hasPuppetActor)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,6);
            WriteUtils.write$TYPE_MESSAGE(param1,this.puppetActor$field);
         }
         for(_loc4_ in this)
         {
            super.writeUnknown(param1,_loc4_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc7_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc7_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc7_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FightAction.actor cannot be set twice.");
                  }
                  _loc3_++;
                  this.actor = new Dto_FightActor();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.actor);
                  break;
               case 2:
                  this.damage.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_FightDamage()));
                  break;
               case 3:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FightAction.counterActor cannot be set twice.");
                  }
                  _loc4_++;
                  this.counterActor = new Dto_FightActor();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.counterActor);
                  break;
               case 4:
                  this.counterDamage.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_FightDamage()));
                  break;
               case 5:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FightAction.actionType cannot be set twice.");
                  }
                  _loc5_++;
                  this.actionType = ReadUtils.read$TYPE_ENUM(param1);
                  break;
               case 6:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FightAction.puppetActor cannot be set twice.");
                  }
                  _loc6_++;
                  this.puppetActor = new Dto_FightPuppetActor();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.puppetActor);
                  break;
               default:
                  super.readUnknown(param1,_loc7_);
                  break;
            }
         }
      }
   }
}
