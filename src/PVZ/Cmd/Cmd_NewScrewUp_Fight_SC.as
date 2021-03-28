package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_NewScrewUp_Fight_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_NewScrewUp_Fight_SC";
      
      public static const STAGEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_NewScrewUp_Fight_SC.stageId","stageId",1 << 3 | WireType.VARINT);
      
      public static const ISSWEEP:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_NewScrewUp_Fight_SC.isSweep","isSweep",2 << 3 | WireType.VARINT);
      
      public static const REPORT:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_NewScrewUp_Fight_SC.report","report",3 << 3 | WireType.LENGTH_DELIMITED,Dto_FightReport);
      
      public static const FIRSTPASS:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_NewScrewUp_Fight_SC.firstPass","firstPass",4 << 3 | WireType.VARINT);
      
      public static const WIN:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_NewScrewUp_Fight_SC.win","win",5 << 3 | WireType.VARINT);
      
      public static const REWARDLIST:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_NewScrewUp_Fight_SC.rewardList","rewardList",6 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
       
      
      private var stageId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var isSweep$field:Boolean;
      
      private var report$field:Dto_FightReport;
      
      private var firstPass$field:Boolean;
      
      private var win$field:Boolean;
      
      public var rewardList:Array;
      
      public function Cmd_NewScrewUp_Fight_SC()
      {
         this.rewardList = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_NewScrewUp_Fight_SC.$MessageID;
      }
      
      public function clearStageId() : void
      {
         this.hasField$0 &= 4294967294;
         this.stageId$field = new uint();
      }
      
      public function get hasStageId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set stageId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.stageId$field = param1;
      }
      
      public function get stageId() : uint
      {
         return this.stageId$field;
      }
      
      public function clearIsSweep() : void
      {
         this.hasField$0 &= 4294967293;
         this.isSweep$field = new Boolean();
      }
      
      public function get hasIsSweep() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set isSweep(param1:Boolean) : void
      {
         this.hasField$0 |= 2;
         this.isSweep$field = param1;
      }
      
      public function get isSweep() : Boolean
      {
         return this.isSweep$field;
      }
      
      public function clearReport() : void
      {
         this.report$field = null;
      }
      
      public function get hasReport() : Boolean
      {
         return this.report$field != null;
      }
      
      public function set report(param1:Dto_FightReport) : void
      {
         this.report$field = param1;
      }
      
      public function get report() : Dto_FightReport
      {
         return this.report$field;
      }
      
      public function clearFirstPass() : void
      {
         this.hasField$0 &= 4294967291;
         this.firstPass$field = new Boolean();
      }
      
      public function get hasFirstPass() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set firstPass(param1:Boolean) : void
      {
         this.hasField$0 |= 4;
         this.firstPass$field = param1;
      }
      
      public function get firstPass() : Boolean
      {
         return this.firstPass$field;
      }
      
      public function clearWin() : void
      {
         this.hasField$0 &= 4294967287;
         this.win$field = new Boolean();
      }
      
      public function get hasWin() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set win(param1:Boolean) : void
      {
         this.hasField$0 |= 8;
         this.win$field = param1;
      }
      
      public function get win() : Boolean
      {
         return this.win$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasStageId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.stageId$field);
         }
         if(this.hasIsSweep)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_BOOL(param1,this.isSweep$field);
         }
         if(this.hasReport)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.report$field);
         }
         if(this.hasFirstPass)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_BOOL(param1,this.firstPass$field);
         }
         if(this.hasWin)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_BOOL(param1,this.win$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.rewardList.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,6);
            WriteUtils.write$TYPE_MESSAGE(param1,this.rewardList[_loc2_]);
            _loc2_++;
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
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
                     throw new IOError("Bad data format: Cmd_NewScrewUp_Fight_SC.stageId cannot be set twice.");
                  }
                  _loc3_++;
                  this.stageId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_NewScrewUp_Fight_SC.isSweep cannot be set twice.");
                  }
                  _loc4_++;
                  this.isSweep = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_NewScrewUp_Fight_SC.report cannot be set twice.");
                  }
                  _loc5_++;
                  this.report = new Dto_FightReport();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.report);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_NewScrewUp_Fight_SC.firstPass cannot be set twice.");
                  }
                  _loc6_++;
                  this.firstPass = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_NewScrewUp_Fight_SC.win cannot be set twice.");
                  }
                  _loc7_++;
                  this.win = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 6:
                  this.rewardList.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_IdNum()));
                  break;
               default:
                  super.readUnknown(param1,_loc8_);
                  break;
            }
         }
      }
   }
}
