; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-baseline-r3/functions/libsodium/variants/c/2_b64_char_to_byte_3.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-baseline-r3/functions/libsodium/variants/c/2_b64_char_to_byte_3.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@b64_char_to_byte.bounds = internal constant [3 x [3 x i32]] [[3 x i32] [i32 65, i32 90, i32 0], [3 x i32] [i32 97, i32 122, i32 26], [3 x i32] [i32 48, i32 57, i32 52]], align 16

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
  %delta = alloca i32, align 4
  %mask = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  store i32 0, ptr %x, align 4
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, ptr %i, align 4
  %cmp = icmp ult i32 %1, 3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32, ptr %u, align 4
  %3 = load i32, ptr %i, align 4
  %idxprom = zext i32 %3 to i64
  %arrayidx = getelementptr inbounds [3 x [3 x i32]], ptr @b64_char_to_byte.bounds, i64 0, i64 %idxprom
  %arrayidx1 = getelementptr inbounds [3 x i32], ptr %arrayidx, i64 0, i64 0
  %4 = load i32, ptr %arrayidx1, align 4
  %sub = sub i32 %2, %4
  store i32 %sub, ptr %delta, align 4
  %5 = load i32, ptr %delta, align 4
  %6 = load i32, ptr %i, align 4
  %idxprom2 = zext i32 %6 to i64
  %arrayidx3 = getelementptr inbounds [3 x [3 x i32]], ptr @b64_char_to_byte.bounds, i64 0, i64 %idxprom2
  %arrayidx4 = getelementptr inbounds [3 x i32], ptr %arrayidx3, i64 0, i64 1
  %7 = load i32, ptr %arrayidx4, align 4
  %8 = load i32, ptr %u, align 4
  %sub5 = sub i32 %7, %8
  %or = or i32 %5, %sub5
  %shr = lshr i32 %or, 8
  %not = xor i32 %shr, -1
  %and = and i32 %not, 255
  store i32 %and, ptr %mask, align 4
  %9 = load i32, ptr %mask, align 4
  %10 = load i32, ptr %delta, align 4
  %11 = load i32, ptr %i, align 4
  %idxprom6 = zext i32 %11 to i64
  %arrayidx7 = getelementptr inbounds [3 x [3 x i32]], ptr @b64_char_to_byte.bounds, i64 0, i64 %idxprom6
  %arrayidx8 = getelementptr inbounds [3 x i32], ptr %arrayidx7, i64 0, i64 2
  %12 = load i32, ptr %arrayidx8, align 4
  %add = add i32 %10, %12
  %and9 = and i32 %9, %add
  %13 = load i32, ptr %x, align 4
  %or10 = or i32 %13, %and9
  store i32 %or10, ptr %x, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %14 = load i32, ptr %i, align 4
  %inc = add i32 %14, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %15 = load i32, ptr %u, align 4
  %xor = xor i32 %15, 43
  %sub11 = sub i32 0, %xor
  %shr12 = lshr i32 %sub11, 8
  %not13 = xor i32 %shr12, -1
  %and14 = and i32 62, %not13
  %16 = load i32, ptr %x, align 4
  %or15 = or i32 %16, %and14
  store i32 %or15, ptr %x, align 4
  %17 = load i32, ptr %u, align 4
  %xor16 = xor i32 %17, 47
  %sub17 = sub i32 0, %xor16
  %shr18 = lshr i32 %sub17, 8
  %not19 = xor i32 %shr18, -1
  %and20 = and i32 63, %not19
  %18 = load i32, ptr %x, align 4
  %or21 = or i32 %18, %and20
  store i32 %or21, ptr %x, align 4
  %19 = load i32, ptr %x, align 4
  %cmp22 = icmp ne i32 %19, 0
  br i1 %cmp22, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.end
  %20 = load i32, ptr %x, align 4
  br label %cond.end

cond.false:                                       ; preds = %for.end
  %21 = load i32, ptr %u, align 4
  %xor23 = xor i32 %21, 65
  %sub24 = sub i32 0, %xor23
  %shr25 = lshr i32 %sub24, 8
  %and26 = and i32 %shr25, 255
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %20, %cond.true ], [ %and26, %cond.false ]
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
