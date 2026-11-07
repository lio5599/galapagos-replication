; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r2/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_6.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r2/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_6.c"
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
  %bit = alloca i32, align 4
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
  %4 = load i32, ptr %x.addr, align 4
  %add = add i32 %4, 65
  %and7 = and i32 %3, %add
  %arrayidx = getelementptr inbounds [5 x i32], ptr %terms, i64 0, i64 0
  store i32 %and7, ptr %arrayidx, align 16
  %5 = load i32, ptr %a, align 4
  %xor = xor i32 %5, 255
  %6 = load i32, ptr %b, align 4
  %and8 = and i32 %xor, %6
  %7 = load i32, ptr %x.addr, align 4
  %add9 = add i32 %7, 71
  %and10 = and i32 %and8, %add9
  %arrayidx11 = getelementptr inbounds [5 x i32], ptr %terms, i64 0, i64 1
  store i32 %and10, ptr %arrayidx11, align 4
  %8 = load i32, ptr %b, align 4
  %xor12 = xor i32 %8, 255
  %9 = load i32, ptr %c, align 4
  %and13 = and i32 %xor12, %9
  %10 = load i32, ptr %x.addr, align 4
  %add14 = add i32 %10, -4
  %and15 = and i32 %and13, %add14
  %arrayidx16 = getelementptr inbounds [5 x i32], ptr %terms, i64 0, i64 2
  store i32 %and15, ptr %arrayidx16, align 8
  %11 = load i32, ptr %x.addr, align 4
  %xor17 = xor i32 %11, 62
  %sub18 = sub i32 0, %xor17
  %shr19 = lshr i32 %sub18, 8
  %and20 = and i32 %shr19, 255
  %xor21 = xor i32 %and20, 255
  %and22 = and i32 %xor21, 45
  %arrayidx23 = getelementptr inbounds [5 x i32], ptr %terms, i64 0, i64 3
  store i32 %and22, ptr %arrayidx23, align 4
  %12 = load i32, ptr %x.addr, align 4
  %xor24 = xor i32 %12, 63
  %sub25 = sub i32 0, %xor24
  %shr26 = lshr i32 %sub25, 8
  %and27 = and i32 %shr26, 255
  %xor28 = xor i32 %and27, 255
  %and29 = and i32 %xor28, 95
  %arrayidx30 = getelementptr inbounds [5 x i32], ptr %terms, i64 0, i64 4
  store i32 %and29, ptr %arrayidx30, align 16
  store i32 1, ptr %bit, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc37, %entry
  %13 = load i32, ptr %bit, align 4
  %cmp = icmp ult i32 %13, 256
  br i1 %cmp, label %for.body, label %for.end38

for.body:                                         ; preds = %for.cond
  store i32 0, ptr %i, align 4
  br label %for.cond31

for.cond31:                                       ; preds = %for.inc, %for.body
  %14 = load i32, ptr %i, align 4
  %cmp32 = icmp ult i32 %14, 5
  br i1 %cmp32, label %for.body33, label %for.end

for.body33:                                       ; preds = %for.cond31
  %15 = load i32, ptr %i, align 4
  %idxprom = zext i32 %15 to i64
  %arrayidx34 = getelementptr inbounds [5 x i32], ptr %terms, i64 0, i64 %idxprom
  %16 = load i32, ptr %arrayidx34, align 4
  %17 = load i32, ptr %bit, align 4
  %and35 = and i32 %16, %17
  %cmp36 = icmp ne i32 %and35, 0
  br i1 %cmp36, label %if.then, label %if.end

if.then:                                          ; preds = %for.body33
  %18 = load i32, ptr %bit, align 4
  %19 = load i32, ptr %result, align 4
  %or = or i32 %19, %18
  store i32 %or, ptr %result, align 4
  br label %for.end

if.end:                                           ; preds = %for.body33
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %20 = load i32, ptr %i, align 4
  %inc = add i32 %20, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond31, !llvm.loop !6

for.end:                                          ; preds = %if.then, %for.cond31
  br label %for.inc37

for.inc37:                                        ; preds = %for.end
  %21 = load i32, ptr %bit, align 4
  %shl = shl i32 %21, 1
  store i32 %shl, ptr %bit, align 4
  br label %for.cond, !llvm.loop !8

for.end38:                                        ; preds = %for.cond
  %22 = load i32, ptr %result, align 4
  ret i32 %22
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
