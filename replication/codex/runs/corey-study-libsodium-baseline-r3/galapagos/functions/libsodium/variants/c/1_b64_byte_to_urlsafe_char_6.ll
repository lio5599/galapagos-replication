; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-baseline-r3/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_6.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-baseline-r3/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_6.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @b64_byte_to_urlsafe_char(i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @b64_byte_to_urlsafe_char(i32 noundef %x) #0 {
entry:
  %x.addr = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %terms = alloca [5 x i32], align 16
  %result = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4
  %sub = sub i32 %0, 26
  %shr = lshr i32 %sub, 8
  store i32 %shr, ptr %a, align 4
  %1 = load i32, ptr %x.addr, align 4
  %sub1 = sub i32 %1, 52
  %shr2 = lshr i32 %sub1, 8
  store i32 %shr2, ptr %b, align 4
  %2 = load i32, ptr %x.addr, align 4
  %sub3 = sub i32 %2, 62
  %shr4 = lshr i32 %sub3, 8
  store i32 %shr4, ptr %c, align 4
  store i32 0, ptr %result, align 4
  %3 = load i32, ptr %a, align 4
  %4 = load i32, ptr %x.addr, align 4
  %add = add i32 %4, 65
  %and = and i32 %3, %add
  %and5 = and i32 %and, 255
  %arrayidx = getelementptr inbounds [5 x i32], ptr %terms, i64 0, i64 0
  store i32 %and5, ptr %arrayidx, align 16
  %5 = load i32, ptr %a, align 4
  %not = xor i32 %5, -1
  %6 = load i32, ptr %b, align 4
  %and6 = and i32 %not, %6
  %7 = load i32, ptr %x.addr, align 4
  %add7 = add i32 %7, 71
  %and8 = and i32 %and6, %add7
  %and9 = and i32 %and8, 255
  %arrayidx10 = getelementptr inbounds [5 x i32], ptr %terms, i64 0, i64 1
  store i32 %and9, ptr %arrayidx10, align 4
  %8 = load i32, ptr %b, align 4
  %not11 = xor i32 %8, -1
  %9 = load i32, ptr %c, align 4
  %and12 = and i32 %not11, %9
  %10 = load i32, ptr %x.addr, align 4
  %add13 = add i32 %10, -4
  %and14 = and i32 %and12, %add13
  %and15 = and i32 %and14, 255
  %arrayidx16 = getelementptr inbounds [5 x i32], ptr %terms, i64 0, i64 2
  store i32 %and15, ptr %arrayidx16, align 8
  %11 = load i32, ptr %x.addr, align 4
  %xor = xor i32 %11, 62
  %sub17 = sub i32 0, %xor
  %shr18 = lshr i32 %sub17, 8
  %not19 = xor i32 %shr18, -1
  %and20 = and i32 %not19, 45
  %and21 = and i32 %and20, 255
  %arrayidx22 = getelementptr inbounds [5 x i32], ptr %terms, i64 0, i64 3
  store i32 %and21, ptr %arrayidx22, align 4
  %12 = load i32, ptr %x.addr, align 4
  %xor23 = xor i32 %12, 63
  %sub24 = sub i32 0, %xor23
  %shr25 = lshr i32 %sub24, 8
  %not26 = xor i32 %shr25, -1
  %and27 = and i32 %not26, 95
  %and28 = and i32 %and27, 255
  %arrayidx29 = getelementptr inbounds [5 x i32], ptr %terms, i64 0, i64 4
  store i32 %and28, ptr %arrayidx29, align 16
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %13 = load i32, ptr %i, align 4
  %cmp = icmp ult i32 %13, 5
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %14 = load i32, ptr %i, align 4
  %idxprom = zext i32 %14 to i64
  %arrayidx30 = getelementptr inbounds [5 x i32], ptr %terms, i64 0, i64 %idxprom
  %15 = load i32, ptr %arrayidx30, align 4
  %16 = load i32, ptr %result, align 4
  %17 = load i32, ptr %i, align 4
  %idxprom31 = zext i32 %17 to i64
  %arrayidx32 = getelementptr inbounds [5 x i32], ptr %terms, i64 0, i64 %idxprom31
  %18 = load i32, ptr %arrayidx32, align 4
  %and33 = and i32 %16, %18
  %sub34 = sub i32 %15, %and33
  %19 = load i32, ptr %result, align 4
  %add35 = add i32 %19, %sub34
  store i32 %add35, ptr %result, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %20 = load i32, ptr %i, align 4
  %inc = add i32 %20, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %21 = load i32, ptr %result, align 4
  ret i32 %21
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
