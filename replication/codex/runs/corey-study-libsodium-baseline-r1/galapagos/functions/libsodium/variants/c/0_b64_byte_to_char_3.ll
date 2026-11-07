; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-baseline-r1/functions/libsodium/variants/c/0_b64_byte_to_char_3.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-baseline-r1/functions/libsodium/variants/c/0_b64_byte_to_char_3.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @b64_byte_to_char(i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @b64_byte_to_char(i32 noundef %x) #0 {
entry:
  %x.addr = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %masks = alloca [5 x i32], align 16
  %values = alloca [5 x i32], align 16
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
  %arrayinit.begin = getelementptr inbounds [5 x i32], ptr %masks, i64 0, i64 0
  %2 = load i32, ptr %a, align 4
  store i32 %2, ptr %arrayinit.begin, align 4
  %arrayinit.element = getelementptr inbounds i32, ptr %arrayinit.begin, i64 1
  %3 = load i32, ptr %a, align 4
  %not = xor i32 %3, -1
  %4 = load i32, ptr %b, align 4
  %and = and i32 %not, %4
  store i32 %and, ptr %arrayinit.element, align 4
  %arrayinit.element3 = getelementptr inbounds i32, ptr %arrayinit.element, i64 1
  %5 = load i32, ptr %b, align 4
  %not4 = xor i32 %5, -1
  %6 = load i32, ptr %x.addr, align 4
  %sub5 = sub i32 %6, 62
  %shr6 = lshr i32 %sub5, 8
  %and7 = and i32 %not4, %shr6
  store i32 %and7, ptr %arrayinit.element3, align 4
  %arrayinit.element8 = getelementptr inbounds i32, ptr %arrayinit.element3, i64 1
  %7 = load i32, ptr %x.addr, align 4
  %xor = xor i32 %7, 62
  %sub9 = sub i32 0, %xor
  %shr10 = lshr i32 %sub9, 8
  %not11 = xor i32 %shr10, -1
  store i32 %not11, ptr %arrayinit.element8, align 4
  %arrayinit.element12 = getelementptr inbounds i32, ptr %arrayinit.element8, i64 1
  %8 = load i32, ptr %x.addr, align 4
  %xor13 = xor i32 %8, 63
  %sub14 = sub i32 0, %xor13
  %shr15 = lshr i32 %sub14, 8
  %not16 = xor i32 %shr15, -1
  store i32 %not16, ptr %arrayinit.element12, align 4
  %arrayinit.begin17 = getelementptr inbounds [5 x i32], ptr %values, i64 0, i64 0
  %9 = load i32, ptr %x.addr, align 4
  %add = add i32 %9, 65
  store i32 %add, ptr %arrayinit.begin17, align 4
  %arrayinit.element18 = getelementptr inbounds i32, ptr %arrayinit.begin17, i64 1
  %10 = load i32, ptr %x.addr, align 4
  %add19 = add i32 %10, 71
  store i32 %add19, ptr %arrayinit.element18, align 4
  %arrayinit.element20 = getelementptr inbounds i32, ptr %arrayinit.element18, i64 1
  %11 = load i32, ptr %x.addr, align 4
  %add21 = add i32 %11, -4
  store i32 %add21, ptr %arrayinit.element20, align 4
  %arrayinit.element22 = getelementptr inbounds i32, ptr %arrayinit.element20, i64 1
  store i32 43, ptr %arrayinit.element22, align 4
  %arrayinit.element23 = getelementptr inbounds i32, ptr %arrayinit.element22, i64 1
  store i32 47, ptr %arrayinit.element23, align 4
  store i32 0, ptr %result, align 4
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %12 = load i32, ptr %i, align 4
  %cmp = icmp ult i32 %12, 5
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %13 = load i32, ptr %i, align 4
  %idxprom = zext i32 %13 to i64
  %arrayidx = getelementptr inbounds [5 x i32], ptr %masks, i64 0, i64 %idxprom
  %14 = load i32, ptr %arrayidx, align 4
  %15 = load i32, ptr %i, align 4
  %idxprom24 = zext i32 %15 to i64
  %arrayidx25 = getelementptr inbounds [5 x i32], ptr %values, i64 0, i64 %idxprom24
  %16 = load i32, ptr %arrayidx25, align 4
  %and26 = and i32 %14, %16
  %17 = load i32, ptr %result, align 4
  %or = or i32 %17, %and26
  store i32 %or, ptr %result, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %18 = load i32, ptr %i, align 4
  %inc = add i32 %18, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %19 = load i32, ptr %result, align 4
  %and27 = and i32 %19, 255
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
