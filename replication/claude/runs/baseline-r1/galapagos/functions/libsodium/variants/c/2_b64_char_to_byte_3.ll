; ModuleID = '/home/liolsen/galapagos-replication/functions/libsodium/variants/c/2_b64_char_to_byte_3.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/libsodium/variants/c/2_b64_char_to_byte_3.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@b64_char_to_byte.r = internal constant [3 x [3 x i32]] [[3 x i32] [i32 65, i32 90, i32 65], [3 x i32] [i32 97, i32 122, i32 71], [3 x i32] [i32 48, i32 57, i32 -4]], align 16
@b64_char_to_byte.s = internal constant [2 x [2 x i32]] [[2 x i32] [i32 43, i32 62], [2 x i32] [i32 47, i32 63]], align 16

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @b64_char_to_byte(i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @b64_char_to_byte(i32 noundef %c) #0 {
entry:
  %c.addr = alloca i32, align 4
  %u = alloca i32, align 4
  %x = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  store i32 0, ptr %x, align 4
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, ptr %i, align 4
  %cmp = icmp slt i32 %1, 3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32, ptr %u, align 4
  %3 = load i32, ptr %i, align 4
  %idxprom = sext i32 %3 to i64
  %arrayidx = getelementptr inbounds [3 x [3 x i32]], ptr @b64_char_to_byte.r, i64 0, i64 %idxprom
  %arrayidx1 = getelementptr inbounds [3 x i32], ptr %arrayidx, i64 0, i64 0
  %4 = load i32, ptr %arrayidx1, align 4
  %sub = sub i32 %2, %4
  %shr = lshr i32 %sub, 8
  %and = and i32 %shr, 255
  %xor = xor i32 %and, 255
  %5 = load i32, ptr %i, align 4
  %idxprom2 = sext i32 %5 to i64
  %arrayidx3 = getelementptr inbounds [3 x [3 x i32]], ptr @b64_char_to_byte.r, i64 0, i64 %idxprom2
  %arrayidx4 = getelementptr inbounds [3 x i32], ptr %arrayidx3, i64 0, i64 1
  %6 = load i32, ptr %arrayidx4, align 4
  %7 = load i32, ptr %u, align 4
  %sub5 = sub i32 %6, %7
  %shr6 = lshr i32 %sub5, 8
  %and7 = and i32 %shr6, 255
  %xor8 = xor i32 %and7, 255
  %and9 = and i32 %xor, %xor8
  %8 = load i32, ptr %u, align 4
  %9 = load i32, ptr %i, align 4
  %idxprom10 = sext i32 %9 to i64
  %arrayidx11 = getelementptr inbounds [3 x [3 x i32]], ptr @b64_char_to_byte.r, i64 0, i64 %idxprom10
  %arrayidx12 = getelementptr inbounds [3 x i32], ptr %arrayidx11, i64 0, i64 2
  %10 = load i32, ptr %arrayidx12, align 4
  %sub13 = sub i32 %8, %10
  %and14 = and i32 %and9, %sub13
  %11 = load i32, ptr %x, align 4
  %or = or i32 %11, %and14
  store i32 %or, ptr %x, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %12 = load i32, ptr %i, align 4
  %inc = add nsw i32 %12, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  store i32 0, ptr %i, align 4
  br label %for.cond15

for.cond15:                                       ; preds = %for.inc31, %for.end
  %13 = load i32, ptr %i, align 4
  %cmp16 = icmp slt i32 %13, 2
  br i1 %cmp16, label %for.body17, label %for.end33

for.body17:                                       ; preds = %for.cond15
  %14 = load i32, ptr %u, align 4
  %15 = load i32, ptr %i, align 4
  %idxprom18 = sext i32 %15 to i64
  %arrayidx19 = getelementptr inbounds [2 x [2 x i32]], ptr @b64_char_to_byte.s, i64 0, i64 %idxprom18
  %arrayidx20 = getelementptr inbounds [2 x i32], ptr %arrayidx19, i64 0, i64 0
  %16 = load i32, ptr %arrayidx20, align 8
  %xor21 = xor i32 %14, %16
  %sub22 = sub i32 0, %xor21
  %shr23 = lshr i32 %sub22, 8
  %and24 = and i32 %shr23, 255
  %xor25 = xor i32 %and24, 255
  %17 = load i32, ptr %i, align 4
  %idxprom26 = sext i32 %17 to i64
  %arrayidx27 = getelementptr inbounds [2 x [2 x i32]], ptr @b64_char_to_byte.s, i64 0, i64 %idxprom26
  %arrayidx28 = getelementptr inbounds [2 x i32], ptr %arrayidx27, i64 0, i64 1
  %18 = load i32, ptr %arrayidx28, align 4
  %and29 = and i32 %xor25, %18
  %19 = load i32, ptr %x, align 4
  %or30 = or i32 %19, %and29
  store i32 %or30, ptr %x, align 4
  br label %for.inc31

for.inc31:                                        ; preds = %for.body17
  %20 = load i32, ptr %i, align 4
  %inc32 = add nsw i32 %20, 1
  store i32 %inc32, ptr %i, align 4
  br label %for.cond15, !llvm.loop !8

for.end33:                                        ; preds = %for.cond15
  %21 = load i32, ptr %x, align 4
  %22 = load i32, ptr %x, align 4
  %sub34 = sub i32 0, %22
  %shr35 = lshr i32 %sub34, 8
  %and36 = and i32 %shr35, 255
  %xor37 = xor i32 %and36, 255
  %23 = load i32, ptr %u, align 4
  %xor38 = xor i32 %23, 65
  %sub39 = sub i32 0, %xor38
  %shr40 = lshr i32 %sub39, 8
  %and41 = and i32 %shr40, 255
  %and42 = and i32 %xor37, %and41
  %or43 = or i32 %21, %and42
  ret i32 %or43
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 17.0.0 (git@github.com:llvm/llvm-project.git 1a7a00bdc99fa2b2ca19ecd2d1069991b3c1006b)"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
