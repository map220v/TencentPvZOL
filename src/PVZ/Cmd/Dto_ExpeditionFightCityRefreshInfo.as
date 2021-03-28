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
   
   public final class Dto_ExpeditionFightCityRefreshInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_ExpeditionFightCityRefreshInfo";
      
      public static const CITYID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ExpeditionFightCityRefreshInfo.cityId","cityId",1 << 3 | WireType.VARINT);
      
      public static const SCORE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ExpeditionFightCityRefreshInfo.score","score",2 << 3 | WireType.VARINT);
      
      public static const ROLENUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ExpeditionFightCityRefreshInfo.roleNum","roleNum",3 << 3 | WireType.VARINT);
      
      public static const SPECIALSCORE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ExpeditionFightCityRefreshInfo.specialScore","specialScore",4 << 3 | WireType.VARINT);
       
      
      private var cityId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var score$field:uint;
      
      private var roleNum$field:uint;
      
      private var specialScore$field:uint;
      
      public function Dto_ExpeditionFightCityRefreshInfo()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_ExpeditionFightCityRefreshInfo.$MessageID;
      }
      
      public function clearCityId() : void
      {
         this.hasField$0 &= 4294967294;
         this.cityId$field = new uint();
      }
      
      public function get hasCityId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set cityId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.cityId$field = param1;
      }
      
      public function get cityId() : uint
      {
         return this.cityId$field;
      }
      
      public function clearScore() : void
      {
         this.hasField$0 &= 4294967293;
         this.score$field = new uint();
      }
      
      public function get hasScore() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set score(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.score$field = param1;
      }
      
      public function get score() : uint
      {
         return this.score$field;
      }
      
      public function clearRoleNum() : void
      {
         this.hasField$0 &= 4294967291;
         this.roleNum$field = new uint();
      }
      
      public function get hasRoleNum() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set roleNum(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.roleNum$field = param1;
      }
      
      public function get roleNum() : uint
      {
         return this.roleNum$field;
      }
      
      public function clearSpecialScore() : void
      {
         this.hasField$0 &= 4294967287;
         this.specialScore$field = new uint();
      }
      
      public function get hasSpecialScore() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set specialScore(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.specialScore$field = param1;
      }
      
      public function get specialScore() : uint
      {
         return this.specialScore$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasCityId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.cityId$field);
         }
         if(this.hasScore)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.score$field);
         }
         if(this.hasRoleNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.roleNum$field);
         }
         if(this.hasSpecialScore)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.specialScore$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
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
                     throw new IOError("Bad data format: Dto_ExpeditionFightCityRefreshInfo.cityId cannot be set twice.");
                  }
                  _loc3_++;
                  this.cityId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ExpeditionFightCityRefreshInfo.score cannot be set twice.");
                  }
                  _loc4_++;
                  this.score = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ExpeditionFightCityRefreshInfo.roleNum cannot be set twice.");
                  }
                  _loc5_++;
                  this.roleNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ExpeditionFightCityRefreshInfo.specialScore cannot be set twice.");
                  }
                  _loc6_++;
                  this.specialScore = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc7_);
                  break;
            }
         }
      }
   }
}
