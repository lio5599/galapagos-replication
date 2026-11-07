; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r2/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_3.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r2/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_3.c"
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
  %2 = load i32, ptr %x.addr, align 4
  %sub4 = sub i32 %2, 62
  %shr5 = lshr i32 %sub4, 8
  %and6 = and i32 %shr5, 255
  store i32 %and6, ptr %c, align 4
  store i32 0, ptr %result, align 4
  %3 = load i32, ptr %a, align 4
  %arrayidx = getelementptr inbounds [5 x i32], ptr %masks, i64 0, i64 0
  store i32 %3, ptr %arrayidx, align 16
  %4 = load i32, ptr %a, align 4
  %xor = xor i32 %4, 255
  %5 = load i32, ptr %b, align 4
  %and7 = and i32 %xor, %5
  %arrayidx8 = getelementptr inbounds [5 x i32], ptr %masks, i64 0, i64 1
  store i32 %and7, ptr %arrayidx8, align 4
  %6 = load i32, ptr %b, align 4
  %xor9 = xor i32 %6, 255
  %7 = load i32, ptr %c, align 4
  %and10 = and i32 %xor9, %7
  %arrayidx11 = getelementptr inbounds [5 x i32], ptr %masks, i64 0, i64 2
  store i32 %and10, ptr %arrayidx11, align 8
  %8 = load i32, ptr %x.addr, align 4
  %xor12 = xor i32 %8, 62
  %sub13 = sub i32 0, %xor12
  %shr14 = lshr i32 %sub13, 8
  %and15 = and i32 %shr14, 255
  %xor16 = xor i32 %and15, 255
  %arrayidx17 = getelementptr inbounds [5 x i32], ptr %masks, i64 0, i64 3
  store i32 %xor16, ptr %arrayidx17, align 4
  %9 = load i32, ptr %x.addr, align 4
  %xor18 = xor i32 %9, 63
  %sub19 = sub i32 0, %xor18
  %shr20 = lshr i32 %sub19, 8
  %and21 = and i32 %shr20, 255
  %xor22 = xor i32 %and21, 255
  %arrayidx23 = getelementptr inbounds [5 x i32], ptr %masks, i64 0, i64 4
  store i32 %xor22, ptr %arrayidx23, align 16
  %10 = load i32, ptr %x.addr, align 4
  %add = add i32 %10, 65
  %arrayidx24 = getelementptr inbounds [5 x i32], ptr %values, i64 0, i64 0
  store i32 %add, ptr %arrayidx24, align 16
  %11 = load i32, ptr %x.addr, align 4
  %add25 = add i32 %11, 71
  %arrayidx26 = getelementptr inbounds [5 x i32], ptr %values, i64 0, i64 1
  store i32 %add25, ptr %arrayidx26, align 4
  %12 = load i32, ptr %x.addr, align 4
  %add27 = add i32 %12, -4
  %arrayidx28 = getelementptr inbounds [5 x i32], ptr %values, i64 0, i64 2
  store i32 %add27, ptr %arrayidx28, align 8
  %arrayidx29 = getelementptr inbounds [5 x i32], ptr %values, i64 0, i64 3
  store i32 45, ptr %arrayidx29, align 4
  %arrayidx30 = getelementptr inbounds [5 x i32], ptr %values, i64 0, i64 4
  store i32 95, ptr %arrayidx30, align 16
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %13 = load i32, ptr %i, align 4
  %cmp = icmp ult i32 %13, 5
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %14 = load i32, ptr %i, align 4
  %idxprom = zext i32 %14 to i64
  %arrayidx31 = getelementptr inbounds [5 x i32], ptr %masks, i64 0, i64 %idxprom
  %15 = load i32, ptr %arrayidx31, align 4
  %16 = load i32, ptr %i, align 4
  %idxprom32 = zext i32 %16 to i64
  %arrayidx33 = getelementptr inbounds [5 x i32], ptr %values, i64 0, i64 %idxprom32
  %17 = load i32, ptr %arrayidx33, align 4
  %and34 = and i32 %15, %17
  %18 = load i32, ptr %result, align 4
  %or = or i32 %18, %and34
  store i32 %or, ptr %result, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %19 = load i32, ptr %i, align 4
  %inc = add i32 %19, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %20 = load i32, ptr %result, align 4
  ret i32 %20
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
