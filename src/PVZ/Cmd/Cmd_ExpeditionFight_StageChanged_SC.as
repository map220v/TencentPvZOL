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
   
   public final class Cmd_ExpeditionFight_StageChanged_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_ExpeditionFight_StageChanged_SC";
      
      public static const SECTIONID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExpeditionFight_StageChanged_SC.sectionId","sectionId",1 << 3 | WireType.VARINT);
      
      public static const BEGINTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExpeditionFight_StageChanged_SC.beginTime","beginTime",2 << 3 | WireType.VARINT);
      
      public static const STAGETYPE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExpeditionFight_StageChanged_SC.stageType","stageType",3 << 3 | WireType.VARINT);
      
      public static const BFIGHTING:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_ExpeditionFight_StageChanged_SC.bFighting","bFighting",4 << 3 | WireType.VARINT);
       
      
      private var sectionId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var beginTime$field:uint;
      
      private var stageType$field:uint;
      
      private var bFighting$field:Boolean;
      
      public function Cmd_ExpeditionFight_StageChanged_SC()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_ExpeditionFight_StageChanged_SC.$MessageID;
      }
      
      public function clearSectionId() : void
      {
         this.hasField$0 &= 4294967294;
         this.sectionId$field = new uint();
      }
      
      public function get hasSectionId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set sectionId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.sectionId$field = param1;
      }
      
      public function get sectionId() : uint
      {
         return this.sectionId$field;
      }
      
      public function clearBeginTime() : void
      {
         this.hasField$0 &= 4294967293;
         this.beginTime$field = new uint();
      }
      
      public function get hasBeginTime() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set beginTime(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.beginTime$field = param1;
      }
      
      public function get beginTime() : uint
      {
         return this.beginTime$field;
      }
      
      public function clearStageType() : void
      {
         this.hasField$0 &= 4294967291;
         this.stageType$field = new uint();
      }
      
      public function get hasStageType() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set stageType(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.stageType$field = param1;
      }
      
      public function get stageType() : uint
      {
         return this.stageType$field;
      }
      
      public function clearBFighting() : void
      {
         this.hasField$0 &= 4294967287;
         this.bFighting$field = new Boolean();
      }
      
      public function get hasBFighting() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set bFighting(param1:Boolean) : void
      {
         this.hasField$0 |= 8;
         this.bFighting$field = param1;
      }
      
      public function get bFighting() : Boolean
      {
         return this.bFighting$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasSectionId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.sectionId$field);
         }
         if(this.hasBeginTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.beginTime$field);
         }
         if(this.hasStageType)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.stageType$field);
         }
         if(this.hasBFighting)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_BOOL(param1,this.bFighting$field);
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
                     throw new IOError("Bad data format: Cmd_ExpeditionFight_StageChanged_SC.sectionId cannot be set twice.");
                  }
                  _loc3_++;
                  this.sectionId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExpeditionFight_StageChanged_SC.beginTime cannot be set twice.");
                  }
                  _loc4_++;
                  this.beginTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExpeditionFight_StageChanged_SC.stageType cannot be set twice.");
                  }
                  _loc5_++;
                  this.stageType = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExpeditionFight_StageChanged_SC.bFighting cannot be set twice.");
                  }
                  _loc6_++;
                  this.bFighting = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc7_);
                  break;
            }
         }
      }
   }
}
