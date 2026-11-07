; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-baseline-r2/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_7.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-baseline-r2/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_7.c"
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
  %arrayinit.begin = getelementptr inbounds [5 x i32], ptr %terms, i64 0, i64 0
  %2 = load i32, ptr %a, align 4
  %3 = load i32, ptr %x.addr, align 4
  %add = add i32 %3, 65
  %and = and i32 %2, %add
  store i32 %and, ptr %arrayinit.begin, align 4
  %arrayinit.element = getelementptr inbounds i32, ptr %arrayinit.begin, i64 1
  %4 = load i32, ptr %a, align 4
  %not = xor i32 %4, -1
  %5 = load i32, ptr %b, align 4
  %and3 = and i32 %not, %5
  %6 = load i32, ptr %x.addr, align 4
  %add4 = add i32 %6, 71
  %and5 = and i32 %and3, %add4
  store i32 %and5, ptr %arrayinit.element, align 4
  %arrayinit.element6 = getelementptr inbounds i32, ptr %arrayinit.element, i64 1
  %7 = load i32, ptr %b, align 4
  %not7 = xor i32 %7, -1
  %8 = load i32, ptr %x.addr, align 4
  %sub8 = sub i32 %8, 62
  %shr9 = lshr i32 %sub8, 8
  %and10 = and i32 %not7, %shr9
  %9 = load i32, ptr %x.addr, align 4
  %add11 = add i32 %9, -4
  %and12 = and i32 %and10, %add11
  store i32 %and12, ptr %arrayinit.element6, align 4
  %arrayinit.element13 = getelementptr inbounds i32, ptr %arrayinit.element6, i64 1
  %10 = load i32, ptr %x.addr, align 4
  %xor = xor i32 %10, 62
  %sub14 = sub i32 0, %xor
  %shr15 = lshr i32 %sub14, 8
  %not16 = xor i32 %shr15, -1
  %and17 = and i32 %not16, 45
  store i32 %and17, ptr %arrayinit.element13, align 4
  %arrayinit.element18 = getelementptr inbounds i32, ptr %arrayinit.element13, i64 1
  %11 = load i32, ptr %x.addr, align 4
  %xor19 = xor i32 %11, 63
  %sub20 = sub i32 0, %xor19
  %shr21 = lshr i32 %sub20, 8
  %not22 = xor i32 %shr21, -1
  %and23 = and i32 %not22, 95
  store i32 %and23, ptr %arrayinit.element18, align 4
  store i32 0, ptr %result, align 4
  store i32 5, ptr %i, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %12 = load i32, ptr %i, align 4
  %cmp = icmp ne i32 %12, 0
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %13 = load i32, ptr %i, align 4
  %dec = add i32 %13, -1
  store i32 %dec, ptr %i, align 4
  %14 = load i32, ptr %i, align 4
  %idxprom = zext i32 %14 to i64
  %arrayidx = getelementptr inbounds [5 x i32], ptr %terms, i64 0, i64 %idxprom
  %15 = load i32, ptr %arrayidx, align 4
  %16 = load i32, ptr %result, align 4
  %not24 = xor i32 %16, -1
  %and25 = and i32 %15, %not24
  %17 = load i32, ptr %result, align 4
  %xor26 = xor i32 %17, %and25
  store i32 %xor26, ptr %result, align 4
  br label %while.cond, !llvm.loop !6

while.end:                                        ; preds = %while.cond
  %18 = load i32, ptr %result, align 4
  %and27 = and i32 %18, 255
  ret i32 %and27
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
