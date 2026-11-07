; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r1/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_3.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r1/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_3.c"
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
  %masks = alloca [5 x i32], align 16
  %values = alloca [5 x i32], align 16
  %result = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4
  %sub = sub i32 %0, 26
  %shr = lshr i32 %sub, 8
  %and = and i32 %shr, 255
  store i32 %and, ptr %a, align 4
  %1 = load i32, ptr %x.addr, align 4
  %sub1 = sub i32 %1, 52
  %shr2 = lshr i32 %sub1, 8
  %and3 = and i32 %shr2, 255
  store i32 %and3, ptr %b, align 4
  %arrayinit.begin = getelementptr inbounds [5 x i32], ptr %masks, i64 0, i64 0
  %2 = load i32, ptr %a, align 4
  store i32 %2, ptr %arrayinit.begin, align 4
  %arrayinit.element = getelementptr inbounds i32, ptr %arrayinit.begin, i64 1
  %3 = load i32, ptr %a, align 4
  %xor = xor i32 %3, 255
  %4 = load i32, ptr %b, align 4
  %and4 = and i32 %xor, %4
  store i32 %and4, ptr %arrayinit.element, align 4
  %arrayinit.element5 = getelementptr inbounds i32, ptr %arrayinit.element, i64 1
  %5 = load i32, ptr %b, align 4
  %xor6 = xor i32 %5, 255
  %6 = load i32, ptr %x.addr, align 4
  %sub7 = sub i32 %6, 62
  %shr8 = lshr i32 %sub7, 8
  %and9 = and i32 %shr8, 255
  %and10 = and i32 %xor6, %and9
  store i32 %and10, ptr %arrayinit.element5, align 4
  %arrayinit.element11 = getelementptr inbounds i32, ptr %arrayinit.element5, i64 1
  %7 = load i32, ptr %x.addr, align 4
  %xor12 = xor i32 %7, 62
  %sub13 = sub i32 0, %xor12
  %shr14 = lshr i32 %sub13, 8
  %and15 = and i32 %shr14, 255
  %xor16 = xor i32 %and15, 255
  store i32 %xor16, ptr %arrayinit.element11, align 4
  %arrayinit.element17 = getelementptr inbounds i32, ptr %arrayinit.element11, i64 1
  %8 = load i32, ptr %x.addr, align 4
  %xor18 = xor i32 %8, 63
  %sub19 = sub i32 0, %xor18
  %shr20 = lshr i32 %sub19, 8
  %and21 = and i32 %shr20, 255
  %xor22 = xor i32 %and21, 255
  store i32 %xor22, ptr %arrayinit.element17, align 4
  %arrayinit.begin23 = getelementptr inbounds [5 x i32], ptr %values, i64 0, i64 0
  %9 = load i32, ptr %x.addr, align 4
  %add = add i32 %9, 65
  store i32 %add, ptr %arrayinit.begin23, align 4
  %arrayinit.element24 = getelementptr inbounds i32, ptr %arrayinit.begin23, i64 1
  %10 = load i32, ptr %x.addr, align 4
  %add25 = add i32 %10, 71
  store i32 %add25, ptr %arrayinit.element24, align 4
  %arrayinit.element26 = getelementptr inbounds i32, ptr %arrayinit.element24, i64 1
  %11 = load i32, ptr %x.addr, align 4
  %add27 = add i32 %11, -4
  store i32 %add27, ptr %arrayinit.element26, align 4
  %arrayinit.element28 = getelementptr inbounds i32, ptr %arrayinit.element26, i64 1
  store i32 45, ptr %arrayinit.element28, align 4
  %arrayinit.element29 = getelementptr inbounds i32, ptr %arrayinit.element28, i64 1
  store i32 95, ptr %arrayinit.element29, align 4
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
  %idxprom30 = zext i32 %15 to i64
  %arrayidx31 = getelementptr inbounds [5 x i32], ptr %values, i64 0, i64 %idxprom30
  %16 = load i32, ptr %arrayidx31, align 4
  %and32 = and i32 %14, %16
  %17 = load i32, ptr %result, align 4
  %or = or i32 %17, %and32
  store i32 %or, ptr %result, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %18 = load i32, ptr %i, align 4
  %inc = add i32 %18, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %19 = load i32, ptr %result, align 4
  ret i32 %19
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
