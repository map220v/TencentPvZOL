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
   
   public final class Cmd_Guard_FightRobTarget_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Guard_FightRobTarget_SC";
      
      public static const REPORT:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Guard_FightRobTarget_SC.report","report",1 << 3 | WireType.LENGTH_DELIMITED,Dto_FightReport);
      
      public static const WIN:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_Guard_FightRobTarget_SC.win","win",2 << 3 | WireType.VARINT);
      
      public static const FINISH:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_Guard_FightRobTarget_SC.finish","finish",3 << 3 | WireType.VARINT);
      
      public static const CARDHP:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Guard_FightRobTarget_SC.cardHp","cardHp",4 << 3 | WireType.LENGTH_DELIMITED,Dto_CardHp);
      
      public static const FINISHTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Guard_FightRobTarget_SC.finishTime","finishTime",5 << 3 | WireType.VARINT);
       
      
      private var report$field:Dto_FightReport;
      
      private var win$field:Boolean;
      
      private var hasField$0:uint = 0;
      
      private var finish$field:Boolean;
      
      public var cardHp:Array;
      
      private var finishTime$field:uint;
      
      public function Cmd_Guard_FightRobTarget_SC()
      {
         this.cardHp = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Guard_FightRobTarget_SC.$MessageID;
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
      
      public function clearWin() : void
      {
         this.hasField$0 &= 4294967294;
         this.win$field = new Boolean();
      }
      
      public function get hasWin() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set win(param1:Boolean) : void
      {
         this.hasField$0 |= 1;
         this.win$field = param1;
      }
      
      public function get win() : Boolean
      {
         return this.win$field;
      }
      
      public function clearFinish() : void
      {
         this.hasField$0 &= 4294967293;
         this.finish$field = new Boolean();
      }
      
      public function get hasFinish() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set finish(param1:Boolean) : void
      {
         this.hasField$0 |= 2;
         this.finish$field = param1;
      }
      
      public function get finish() : Boolean
      {
         return this.finish$field;
      }
      
      public function clearFinishTime() : void
      {
         this.hasField$0 &= 4294967291;
         this.finishTime$field = new uint();
      }
      
      public function get hasFinishTime() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set finishTime(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.finishTime$field = param1;
      }
      
      public function get finishTime() : uint
      {
         return this.finishTime$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasReport)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.report$field);
         }
         if(this.hasWin)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_BOOL(param1,this.win$field);
         }
         if(this.hasFinish)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_BOOL(param1,this.finish$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.cardHp.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_MESSAGE(param1,this.cardHp[_loc2_]);
            _loc2_++;
         }
         if(this.hasFinishTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.finishTime$field);
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
                     throw new IOError("Bad data format: Cmd_Guard_FightRobTarget_SC.report cannot be set twice.");
                  }
                  _loc3_++;
                  this.report = new Dto_FightReport();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.report);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Guard_FightRobTarget_SC.win cannot be set twice.");
                  }
                  _loc4_++;
                  this.win = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Guard_FightRobTarget_SC.finish cannot be set twice.");
                  }
                  _loc5_++;
                  this.finish = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 4:
                  this.cardHp.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_CardHp()));
                  break;
               case 5:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Guard_FightRobTarget_SC.finishTime cannot be set twice.");
                  }
                  _loc6_++;
                  this.finishTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc7_);
                  break;
            }
         }
      }
   }
}
