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
   
   public final class Dto_TalentInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_TalentInfo";
      
      public static const TALENTID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_TalentInfo.talentId","talentId",1 << 3 | WireType.VARINT);
      
      public static const HASSTUDY:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_TalentInfo.hasStudy","hasStudy",2 << 3 | WireType.VARINT);
      
      public static const SATISFYPOWER:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_TalentInfo.satisfyPower","satisfyPower",3 << 3 | WireType.VARINT);
      
      public static const SATISFYCONDITION:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_TalentInfo.satisfyCondition","satisfyCondition",4 << 3 | WireType.VARINT);
       
      
      private var talentId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var hasStudy$field:Boolean;
      
      private var satisfyPower$field:Boolean;
      
      private var satisfyCondition$field:Boolean;
      
      public function Dto_TalentInfo()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_TalentInfo.$MessageID;
      }
      
      public function clearTalentId() : void
      {
         this.hasField$0 &= 4294967294;
         this.talentId$field = new uint();
      }
      
      public function get hasTalentId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set talentId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.talentId$field = param1;
      }
      
      public function get talentId() : uint
      {
         return this.talentId$field;
      }
      
      public function clearHasStudy() : void
      {
         this.hasField$0 &= 4294967293;
         this.hasStudy$field = new Boolean();
      }
      
      public function get hasHasStudy() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set hasStudy(param1:Boolean) : void
      {
         this.hasField$0 |= 2;
         this.hasStudy$field = param1;
      }
      
      public function get hasStudy() : Boolean
      {
         return this.hasStudy$field;
      }
      
      public function clearSatisfyPower() : void
      {
         this.hasField$0 &= 4294967291;
         this.satisfyPower$field = new Boolean();
      }
      
      public function get hasSatisfyPower() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set satisfyPower(param1:Boolean) : void
      {
         this.hasField$0 |= 4;
         this.satisfyPower$field = param1;
      }
      
      public function get satisfyPower() : Boolean
      {
         return this.satisfyPower$field;
      }
      
      public function clearSatisfyCondition() : void
      {
         this.hasField$0 &= 4294967287;
         this.satisfyCondition$field = new Boolean();
      }
      
      public function get hasSatisfyCondition() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set satisfyCondition(param1:Boolean) : void
      {
         this.hasField$0 |= 8;
         this.satisfyCondition$field = param1;
      }
      
      public function get satisfyCondition() : Boolean
      {
         return this.satisfyCondition$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasTalentId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.talentId$field);
         }
         if(this.hasHasStudy)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_BOOL(param1,this.hasStudy$field);
         }
         if(this.hasSatisfyPower)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_BOOL(param1,this.satisfyPower$field);
         }
         if(this.hasSatisfyCondition)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_BOOL(param1,this.satisfyCondition$field);
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
                     throw new IOError("Bad data format: Dto_TalentInfo.talentId cannot be set twice.");
                  }
                  _loc3_++;
                  this.talentId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_TalentInfo.hasStudy cannot be set twice.");
                  }
                  _loc4_++;
                  this.hasStudy = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_TalentInfo.satisfyPower cannot be set twice.");
                  }
                  _loc5_++;
                  this.satisfyPower = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_TalentInfo.satisfyCondition cannot be set twice.");
                  }
                  _loc6_++;
                  this.satisfyCondition = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc7_);
                  break;
            }
         }
      }
   }
}
