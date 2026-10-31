; ModuleID = '/home/liolsen/galapagos-replication/functions/alsa-lib/variants/c/3_ulaw_to_s16_6.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/alsa-lib/variants/c/3_ulaw_to_s16_6.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @ulaw_to_s16(i8 noundef zeroext 97)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @ulaw_to_s16(i8 noundef zeroext %u_val) #0 {
entry:
  %u_val.addr = alloca i8, align 1
  %u = alloca i32, align 4
  %t = alloca i32, align 4
  %e = alloca i32, align 4
  store i8 %u_val, ptr %u_val.addr, align 1
  %0 = load i8, ptr %u_val.addr, align 1
  %conv = zext i8 %0 to i32
  %xor = xor i32 %conv, 255
  store i32 %xor, ptr %u, align 4
  %1 = load i32, ptr %u, align 4
  %and = and i32 %1, 15
  %shl = shl i32 %and, 3
  %add = add nsw i32 %shl, 132
  store i32 %add, ptr %t, align 4
  %2 = load i32, ptr %u, align 4
  %shr = ashr i32 %2, 4
  %and1 = and i32 %shr, 7
  store i32 %and1, ptr %e, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %3 = load i32, ptr %e, align 4
  %cmp = icmp sgt i32 %3, 0
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %4 = load i32, ptr %t, align 4
  %5 = load i32, ptr %t, align 4
  %add3 = add nsw i32 %5, %4
  store i32 %add3, ptr %t, align 4
  %6 = load i32, ptr %e, align 4
  %dec = add nsw i32 %6, -1
  store i32 %dec, ptr %e, align 4
  br label %while.cond, !llvm.loop !6

while.end:                                        ; preds = %while.cond
  %7 = load i32, ptr %u, align 4
  %and4 = and i32 %7, 128
  %tobool = icmp ne i32 %and4, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %while.end
  %8 = load i32, ptr %t, align 4
  %sub = sub nsw i32 132, %8
  br label %cond.end

cond.false:                                       ; preds = %while.end
  %9 = load i32, ptr %t, align 4
  %sub5 = sub nsw i32 %9, 132
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %sub, %cond.true ], [ %sub5, %cond.false ]
  ret i32 %cond
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
