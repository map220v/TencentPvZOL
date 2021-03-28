package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_ExpeditionFight_RefreshInfo_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_ExpeditionFight_RefreshInfo_SC";
      
      public static const SIDE:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_ExpeditionFight_RefreshInfo_SC.side","side",1 << 3 | WireType.LENGTH_DELIMITED,Dto_ExpeditionFightSideRefreshInfo);
      
      public static const TOPREPORT:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_ExpeditionFight_RefreshInfo_SC.topReport","topReport",2 << 3 | WireType.LENGTH_DELIMITED,Dto_ExpeditionFightReportInfo);
      
      public static const REPORT:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_ExpeditionFight_RefreshInfo_SC.report","report",3 << 3 | WireType.LENGTH_DELIMITED,Dto_ExpeditionFightReportInfo);
      
      public static const NPC:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_ExpeditionFight_RefreshInfo_SC.npc","npc",4 << 3 | WireType.LENGTH_DELIMITED,Dto_ExpeditionFightNpcInfo);
       
      
      public var side:Array;
      
      public var topReport:Array;
      
      public var report:Array;
      
      private var npc$field:Dto_ExpeditionFightNpcInfo;
      
      public function Cmd_ExpeditionFight_RefreshInfo_SC()
      {
         this.side = [];
         this.topReport = [];
         this.report = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_ExpeditionFight_RefreshInfo_SC.$MessageID;
      }
      
      public function clearNpc() : void
      {
         this.npc$field = null;
      }
      
      public function get hasNpc() : Boolean
      {
         return this.npc$field != null;
      }
      
      public function set npc(param1:Dto_ExpeditionFightNpcInfo) : void
      {
         this.npc$field = param1;
      }
      
      public function get npc() : Dto_ExpeditionFightNpcInfo
      {
         return this.npc$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc5_:* = undefined;
         var _loc2_:uint = 0;
         while(_loc2_ < this.side.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.side[_loc2_]);
            _loc2_++;
         }
         var _loc3_:uint = 0;
         while(_loc3_ < this.topReport.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.topReport[_loc3_]);
            _loc3_++;
         }
         var _loc4_:uint = 0;
         while(_loc4_ < this.report.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_MESSAGE(param1,this.report[_loc4_]);
            _loc4_++;
         }
         if(this.hasNpc)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_MESSAGE(param1,this.npc$field);
         }
         for(_loc5_ in this)
         {
            super.writeUnknown(param1,_loc5_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc4_:uint = 0;
         var _loc3_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc4_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc4_ >> 3)
            {
               case 1:
                  this.side.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_ExpeditionFightSideRefreshInfo()));
                  break;
               case 2:
                  this.topReport.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_ExpeditionFightReportInfo()));
                  break;
               case 3:
                  this.report.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_ExpeditionFightReportInfo()));
                  break;
               case 4:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExpeditionFight_RefreshInfo_SC.npc cannot be set twice.");
                  }
                  _loc3_++;
                  this.npc = new Dto_ExpeditionFightNpcInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.npc);
                  break;
               default:
                  super.readUnknown(param1,_loc4_);
                  break;
            }
         }
      }
   }
}
