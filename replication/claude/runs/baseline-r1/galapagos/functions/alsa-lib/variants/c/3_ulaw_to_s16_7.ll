; ModuleID = '/home/liolsen/galapagos-replication/functions/alsa-lib/variants/c/3_ulaw_to_s16_7.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/alsa-lib/variants/c/3_ulaw_to_s16_7.c"
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
  %mantissa = alloca i32, align 4
  %t = alloca i32, align 4
  store i8 %u_val, ptr %u_val.addr, align 1
  %0 = load i8, ptr %u_val.addr, align 1
  %conv = zext i8 %0 to i32
  %xor = xor i32 %conv, 255
  store i32 %xor, ptr %u, align 4
  %1 = load i32, ptr %u, align 4
  %and = and i32 %1, 15
  store i32 %and, ptr %mantissa, align 4
  %2 = load i32, ptr %u, align 4
  %shr = ashr i32 %2, 4
  %and1 = and i32 %shr, 7
  switch i32 %and1, label %sw.default [
    i32 0, label %sw.bb
    i32 1, label %sw.bb2
    i32 2, label %sw.bb5
    i32 3, label %sw.bb8
    i32 4, label %sw.bb11
    i32 5, label %sw.bb14
    i32 6, label %sw.bb17
  ]

sw.bb:                                            ; preds = %entry
  %3 = load i32, ptr %mantissa, align 4
  %shl = shl i32 %3, 3
  %add = add nsw i32 %shl, 132
  store i32 %add, ptr %t, align 4
  br label %sw.epilog

sw.bb2:                                           ; preds = %entry
  %4 = load i32, ptr %mantissa, align 4
  %shl3 = shl i32 %4, 4
  %add4 = add nsw i32 %shl3, 264
  store i32 %add4, ptr %t, align 4
  br label %sw.epilog

sw.bb5:                                           ; preds = %entry
  %5 = load i32, ptr %mantissa, align 4
  %shl6 = shl i32 %5, 5
  %add7 = add nsw i32 %shl6, 528
  store i32 %add7, ptr %t, align 4
  br label %sw.epilog

sw.bb8:                                           ; preds = %entry
  %6 = load i32, ptr %mantissa, align 4
  %shl9 = shl i32 %6, 6
  %add10 = add nsw i32 %shl9, 1056
  store i32 %add10, ptr %t, align 4
  br label %sw.epilog

sw.bb11:                                          ; preds = %entry
  %7 = load i32, ptr %mantissa, align 4
  %shl12 = shl i32 %7, 7
  %add13 = add nsw i32 %shl12, 2112
  store i32 %add13, ptr %t, align 4
  br label %sw.epilog

sw.bb14:                                          ; preds = %entry
  %8 = load i32, ptr %mantissa, align 4
  %shl15 = shl i32 %8, 8
  %add16 = add nsw i32 %shl15, 4224
  store i32 %add16, ptr %t, align 4
  br label %sw.epilog

sw.bb17:                                          ; preds = %entry
  %9 = load i32, ptr %mantissa, align 4
  %shl18 = shl i32 %9, 9
  %add19 = add nsw i32 %shl18, 8448
  store i32 %add19, ptr %t, align 4
  br label %sw.epilog

sw.default:                                       ; preds = %entry
  %10 = load i32, ptr %mantissa, align 4
  %shl20 = shl i32 %10, 10
  %add21 = add nsw i32 %shl20, 16896
  store i32 %add21, ptr %t, align 4
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default, %sw.bb17, %sw.bb14, %sw.bb11, %sw.bb8, %sw.bb5, %sw.bb2, %sw.bb
  %11 = load i32, ptr %t, align 4
  %sub = sub nsw i32 %11, 132
  store i32 %sub, ptr %t, align 4
  %12 = load i32, ptr %u, align 4
  %and22 = and i32 %12, 128
  %tobool = icmp ne i32 %and22, 0
  br i1 %tobool, label %cond.true, label %cond.false

cond.true:                                        ; preds = %sw.epilog
  %13 = load i32, ptr %t, align 4
  %sub23 = sub nsw i32 0, %13
  br label %cond.end

cond.false:                                       ; preds = %sw.epilog
  %14 = load i32, ptr %t, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %sub23, %cond.true ], [ %14, %cond.false ]
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
