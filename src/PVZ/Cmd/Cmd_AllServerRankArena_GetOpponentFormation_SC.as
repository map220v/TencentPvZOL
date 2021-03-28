package PVZ.Cmd
{
   import com.tencent.protobuf.Int64;
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT64;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_AllServerRankArena_GetOpponentFormation_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_AllServerRankArena_GetOpponentFormation_SC";
      
      public static const ROLEID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Cmd_AllServerRankArena_GetOpponentFormation_SC.roleId","roleId",1 << 3 | WireType.VARINT);
      
      public static const RANK:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_AllServerRankArena_GetOpponentFormation_SC.rank","rank",2 << 3 | WireType.VARINT);
      
      public static const ENEMYCARD:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_AllServerRankArena_GetOpponentFormation_SC.enemyCard","enemyCard",3 << 3 | WireType.LENGTH_DELIMITED,Dto_EnemyCardInfo);
      
      public static const ENEMYTOTALPOWER:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_AllServerRankArena_GetOpponentFormation_SC.enemyTotalPower","enemyTotalPower",4 << 3 | WireType.VARINT);
      
      public static const PUPPETFORMATION:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_AllServerRankArena_GetOpponentFormation_SC.puppetformation","puppetformation",5 << 3 | WireType.LENGTH_DELIMITED,Dto_PuppetFormation);
       
      
      private var roleId$field:Int64;
      
      private var rank$field:uint;
      
      private var hasField$0:uint = 0;
      
      public var enemyCard:Array;
      
      private var enemyTotalPower$field:uint;
      
      private var puppetformation$field:Dto_PuppetFormation;
      
      public function Cmd_AllServerRankArena_GetOpponentFormation_SC()
      {
         this.enemyCard = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_AllServerRankArena_GetOpponentFormation_SC.$MessageID;
      }
      
      public function clearRoleId() : void
      {
         this.roleId$field = null;
      }
      
      public function get hasRoleId() : Boolean
      {
         return this.roleId$field != null;
      }
      
      public function set roleId(param1:Int64) : void
      {
         this.roleId$field = param1;
      }
      
      public function get roleId() : Int64
      {
         return this.roleId$field;
      }
      
      public function clearRank() : void
      {
         this.hasField$0 &= 4294967294;
         this.rank$field = new uint();
      }
      
      public function get hasRank() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set rank(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.rank$field = param1;
      }
      
      public function get rank() : uint
      {
         return this.rank$field;
      }
      
      public function clearEnemyTotalPower() : void
      {
         this.hasField$0 &= 4294967293;
         this.enemyTotalPower$field = new uint();
      }
      
      public function get hasEnemyTotalPower() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set enemyTotalPower(param1:uint) : void
      {
         this.hasField$0 |= 2;
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
         if(this.hasRoleId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_INT64(param1,this.roleId$field);
         }
         if(this.hasRank)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.rank$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.enemyCard.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.enemyCard[_loc2_]);
            _loc2_++;
         }
         if(this.hasEnemyTotalPower)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.enemyTotalPower$field);
         }
         if(this.hasPuppetformation)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,5);
            WriteUtils.write$TYPE_MESSAGE(param1,this.puppetformation$field);
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
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
                     throw new IOError("Bad data format: Cmd_AllServerRankArena_GetOpponentFormation_SC.roleId cannot be set twice.");
                  }
                  _loc3_++;
                  this.roleId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_AllServerRankArena_GetOpponentFormation_SC.rank cannot be set twice.");
                  }
                  _loc4_++;
                  this.rank = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  this.enemyCard.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_EnemyCardInfo()));
                  break;
               case 4:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_AllServerRankArena_GetOpponentFormation_SC.enemyTotalPower cannot be set twice.");
                  }
                  _loc5_++;
                  this.enemyTotalPower = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_AllServerRankArena_GetOpponentFormation_SC.puppetformation cannot be set twice.");
                  }
                  _loc6_++;
                  this.puppetformation = new Dto_PuppetFormation();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.puppetformation);
                  break;
               default:
                  super.readUnknown(param1,_loc7_);
                  break;
            }
         }
      }
   }
}
