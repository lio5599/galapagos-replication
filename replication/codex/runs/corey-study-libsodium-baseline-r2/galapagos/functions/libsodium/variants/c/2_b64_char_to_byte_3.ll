; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-baseline-r2/functions/libsodium/variants/c/2_b64_char_to_byte_3.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-baseline-r2/functions/libsodium/variants/c/2_b64_char_to_byte_3.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

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
  %terms = alloca [5 x i32], align 16
  %x = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  store i32 0, ptr %x, align 4
  %1 = load i32, ptr %u, align 4
  %sub = sub i32 %1, 65
  %shr = lshr i32 %sub, 8
  %and = and i32 %shr, 255
  %xor = xor i32 255, %and
  %2 = load i32, ptr %u, align 4
  %sub1 = sub i32 90, %2
  %shr2 = lshr i32 %sub1, 8
  %and3 = and i32 %shr2, 255
  %xor4 = xor i32 255, %and3
  %and5 = and i32 %xor, %xor4
  %3 = load i32, ptr %u, align 4
  %sub6 = sub i32 %3, 65
  %and7 = and i32 %and5, %sub6
  %arrayidx = getelementptr inbounds [5 x i32], ptr %terms, i64 0, i64 0
  store i32 %and7, ptr %arrayidx, align 16
  %4 = load i32, ptr %u, align 4
  %sub8 = sub i32 %4, 97
  %shr9 = lshr i32 %sub8, 8
  %and10 = and i32 %shr9, 255
  %xor11 = xor i32 255, %and10
  %5 = load i32, ptr %u, align 4
  %sub12 = sub i32 122, %5
  %shr13 = lshr i32 %sub12, 8
  %and14 = and i32 %shr13, 255
  %xor15 = xor i32 255, %and14
  %and16 = and i32 %xor11, %xor15
  %6 = load i32, ptr %u, align 4
  %sub17 = sub i32 %6, 71
  %and18 = and i32 %and16, %sub17
  %arrayidx19 = getelementptr inbounds [5 x i32], ptr %terms, i64 0, i64 1
  store i32 %and18, ptr %arrayidx19, align 4
  %7 = load i32, ptr %u, align 4
  %sub20 = sub i32 %7, 48
  %shr21 = lshr i32 %sub20, 8
  %and22 = and i32 %shr21, 255
  %xor23 = xor i32 255, %and22
  %8 = load i32, ptr %u, align 4
  %sub24 = sub i32 57, %8
  %shr25 = lshr i32 %sub24, 8
  %and26 = and i32 %shr25, 255
  %xor27 = xor i32 255, %and26
  %and28 = and i32 %xor23, %xor27
  %9 = load i32, ptr %u, align 4
  %sub29 = sub i32 %9, -4
  %and30 = and i32 %and28, %sub29
  %arrayidx31 = getelementptr inbounds [5 x i32], ptr %terms, i64 0, i64 2
  store i32 %and30, ptr %arrayidx31, align 8
  %10 = load i32, ptr %u, align 4
  %xor32 = xor i32 %10, 43
  %sub33 = sub i32 0, %xor32
  %shr34 = lshr i32 %sub33, 8
  %and35 = and i32 %shr34, 255
  %xor36 = xor i32 255, %and35
  %and37 = and i32 %xor36, 62
  %arrayidx38 = getelementptr inbounds [5 x i32], ptr %terms, i64 0, i64 3
  store i32 %and37, ptr %arrayidx38, align 4
  %11 = load i32, ptr %u, align 4
  %xor39 = xor i32 %11, 47
  %sub40 = sub i32 0, %xor39
  %shr41 = lshr i32 %sub40, 8
  %and42 = and i32 %shr41, 255
  %xor43 = xor i32 255, %and42
  %and44 = and i32 %xor43, 63
  %arrayidx45 = getelementptr inbounds [5 x i32], ptr %terms, i64 0, i64 4
  store i32 %and44, ptr %arrayidx45, align 16
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %12 = load i32, ptr %i, align 4
  %cmp = icmp ult i32 %12, 5
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %13 = load i32, ptr %i, align 4
  %idxprom = zext i32 %13 to i64
  %arrayidx46 = getelementptr inbounds [5 x i32], ptr %terms, i64 0, i64 %idxprom
  %14 = load i32, ptr %arrayidx46, align 4
  %15 = load i32, ptr %x, align 4
  %or = or i32 %15, %14
  store i32 %or, ptr %x, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %16 = load i32, ptr %i, align 4
  %inc = add i32 %16, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %17 = load i32, ptr %x, align 4
  %cmp47 = icmp ne i32 %17, 0
  br i1 %cmp47, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.end
  %18 = load i32, ptr %x, align 4
  br label %cond.end

cond.false:                                       ; preds = %for.end
  %19 = load i32, ptr %u, align 4
  %xor48 = xor i32 %19, 65
  %sub49 = sub i32 0, %xor48
  %shr50 = lshr i32 %sub49, 8
  %and51 = and i32 %shr50, 255
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %18, %cond.true ], [ %and51, %cond.false ]
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
