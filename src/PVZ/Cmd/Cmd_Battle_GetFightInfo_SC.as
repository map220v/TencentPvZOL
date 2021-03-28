package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Battle_GetFightInfo_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Battle_GetFightInfo_SC";
      
      public static const FORMATION:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Battle_GetFightInfo_SC.formation","formation",1 << 3 | WireType.LENGTH_DELIMITED,Dto_FormationInfo);
      
      public static const ENEMYCARD:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Battle_GetFightInfo_SC.enemyCard","enemyCard",4 << 3 | WireType.LENGTH_DELIMITED,Dto_EnemyCardInfo);
      
      public static const ENEMYTOTALPOWER:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Battle_GetFightInfo_SC.enemyTotalPower","enemyTotalPower",5 << 3 | WireType.VARINT);
      
      public static const PUPPETFORMATION:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Battle_GetFightInfo_SC.puppetformation","puppetformation",6 << 3 | WireType.LENGTH_DELIMITED,Dto_PuppetFormation);
       
      
      private var formation$field:Dto_FormationInfo;
      
      public var enemyCard:Array;
      
      private var enemyTotalPower$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var puppetformation$field:Dto_PuppetFormation;
      
      public function Cmd_Battle_GetFightInfo_SC()
      {
         this.enemyCard = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Battle_GetFightInfo_SC.$MessageID;
      }
      
      public function clearFormation() : void
      {
         this.formation$field = null;
      }
      
      public function get hasFormation() : Boolean
      {
         return this.formation$field != null;
      }
      
      public function set formation(param1:Dto_FormationInfo) : void
      {
         this.formation$field = param1;
      }
      
      public function get formation() : Dto_FormationInfo
      {
         return this.formation$field;
      }
      
      public function clearEnemyTotalPower() : void
      {
         this.hasField$0 &= 4294967294;
         this.enemyTotalPower$field = new uint();
      }
      
      public function get hasEnemyTotalPower() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set enemyTotalPower(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.enemyTotalPower$field = param1;
      }
      
      public function get enemyTotalPower() : uint
      {
         return this.enemyTotalPower$field;
      }
      
      public function clearPuppetformation() : void
      {
         this.puppetformation$field = null;
      }
      
      public function get hasPuppetformation() : Boolean
      {
         return this.puppetformation$field != null;
      }
      
      public function set puppetformation(param1:Dto_PuppetFormation) : void
      {
         this.puppetformation$field = param1;
      }
      
      public function get puppetformation() : Dto_PuppetFormation
      {
         return this.puppetformation$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasFormation)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.formation$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.enemyCard.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_MESSAGE(param1,this.enemyCard[_loc2_]);
            _loc2_++;
         }
         if(this.hasEnemyTotalPower)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.enemyTotalPower$field);
         }
         if(this.hasPuppetformation)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,6);
            WriteUtils.write$TYPE_MESSAGE(param1,this.puppetformation$field);
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
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
                     throw new IOError("Bad data format: Cmd_Battle_GetFightInfo_SC.formation cannot be set twice.");
                  }
                  _loc3_++;
                  this.formation = new Dto_FormationInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.formation);
                  break;
               case 4:
                  this.enemyCard.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_EnemyCardInfo()));
                  break;
               case 5:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Battle_GetFightInfo_SC.enemyTotalPower cannot be set twice.");
                  }
                  _loc4_++;
                  this.enemyTotalPower = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Battle_GetFightInfo_SC.puppetformation cannot be set twice.");
                  }
                  _loc5_++;
                  this.puppetformation = new Dto_PuppetFormation();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.puppetformation);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
